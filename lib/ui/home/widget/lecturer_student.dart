import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/size_config.dart';

class LecturerToStudent extends StatefulWidget {
  const LecturerToStudent({Key? key}) : super(key: key);

  @override
  State<LecturerToStudent> createState() => _LecturerToStudentState();
}

class _LecturerToStudentState extends State<LecturerToStudent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseDatabase.instance
          .ref('add_note_lecturer/')
          .orderByChild('category')
          .equalTo('Student')
          .onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          final res = <Widget>[];
          final myOrder = Map<String, dynamic>.from(
              (snapshot.data! as dynamic).snapshot.value);

          myOrder.forEach(
            (key, value) {
              final nextOrder = Map<String, dynamic>.from(value);

              final data = Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title: ${nextOrder['title']}",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${nextOrder['Date']}",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical,
                    ),
                    Text(
                      "Subtiel : ${nextOrder['description']}",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical,
                    ),
                    Row(
                      children: [
                        Text(
                          "posted by : ${nextOrder['postedBy']}",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );

              res.add(data);
            },
          );

          return Column(
            children: res,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
