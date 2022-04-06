import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/size_config.dart';
import 'package:noticeboard_system/core/styles.dart';

class AdminLecturer extends StatefulWidget {
  const AdminLecturer({Key? key}) : super(key: key);

  @override
  State<AdminLecturer> createState() => _AdminLecturerState();
}

class _AdminLecturerState extends State<AdminLecturer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref('add_note_admin/')
            .orderByChild('category')
            .equalTo('Lecturer')
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

            if (snapshot.data == null ||
                (snapshot.data! as dynamic).snapshot.value == null) {
              res.add(SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Center(
                  child: Text(
                    'You don’t have  \n a message',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: kInActiveColor,
                    ),
                  ),
                ),
              ));
            } else {
              final myOrder = Map<String, dynamic>.from(
                  (snapshot.data! as dynamic).snapshot.value);

              myOrder.forEach(
                (key, value) {
                  final nextOrder = Map<String, dynamic>.from(value);

                  final data = InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewFullDetails(
                            text: nextOrder['title'],
                            description: nextOrder['description'],
                            from: nextOrder['postedBy'],
                            date: nextOrder['Date'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
                    ),
                  );

                  res.add(data);
                },
              );
            }

            return Column(
              children: res,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ViewFullDetails extends StatelessWidget {
  const ViewFullDetails({
    Key? key,
    required this.text,
    required this.description,
    required this.from,
    required this.date,
  }) : super(key: key);
  final String text;
  final String description;
  final String from;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text('Message'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text),
                  const Divider(),
                  Text(description),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('From: $from'),
                      Text('Date: $date'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
