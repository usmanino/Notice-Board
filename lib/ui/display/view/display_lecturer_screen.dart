import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';

class DisplayLecturerScreen extends StatefulWidget {
  const DisplayLecturerScreen({Key? key}) : super(key: key);

  @override
  State<DisplayLecturerScreen> createState() => _DisplayLecturerScreenState();
}

class _DisplayLecturerScreenState extends State<DisplayLecturerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   bool isPress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 14, 182, 159),
        title: Text(
          'View Lecturer',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kWhiteColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: StreamBuilder(
            stream: FirebaseDatabase.instance
                .ref('register/')
                .orderByChild('userRole')
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
                final myOrder = Map<String, dynamic>.from(
                    (snapshot.data! as dynamic).snapshot.value);

                myOrder.forEach((key, value) {
                  final nextOrder = Map<String, dynamic>.from(value);
                  final data = Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Fullnmae: ${nextOrder['firstname']}',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.minBlockHorizontal,
                              ),
                              Text(
                                '${nextOrder['lastname']}',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.minBlockVertical,
                          ),
                          Text(
                            'Gender: ${nextOrder['gender']}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.minBlockVertical,
                          ),
                          Text(
                            'Email: ${nextOrder['email']}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.minBlockVertical,
                          ),
                          Text(
                            'Phone Number: ${nextOrder['phone']}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  res.add(data);
                });

                return Column(
                  children: res,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
