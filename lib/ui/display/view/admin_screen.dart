import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/controller/user_provider.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor2,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 14, 182, 159),
        title: Text(
          'View profile',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Sizer(builder: (context, orientation, deviceType) {
        return Stack(
          children: [
            Column(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 2.0,
                      ),
                      height: 200,
                      width: SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 182, 159),
                      ),
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 15,
              right: 15,
              top: 150,
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                foregroundColor: Colors.transparent,
                                child: Icon(Icons.person),
                              ),
                              SizedBox(
                                width: SizeConfig.minBlockHorizontal! * 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${userProvider.getUserRole['firstname']} ${userProvider.getUserRole['lastname']}",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    userProvider.getUserRole['userRole'],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.wc),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                userProvider.getUserRole['gender'],
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.date_range),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                userProvider.getUserRole['Date'],
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.call),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                userProvider.getUserRole['phone'],
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mail_outline),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                userProvider.getUserRole['email'],
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
