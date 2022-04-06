import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';

class DisplayStudenScreen extends StatefulWidget {
  const DisplayStudenScreen({Key? key}) : super(key: key);

  @override
  State<DisplayStudenScreen> createState() => _DisplayStudenScreenState();
}

class _DisplayStudenScreenState extends State<DisplayStudenScreen> {
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
          'View Student',
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

                if (snapshot.data == null ||
                    (snapshot.data! as dynamic).snapshot.value == null) {
                  res.add(SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Center(
                      child: Text(
                        'You don’t have  \n a student',
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
                }

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
