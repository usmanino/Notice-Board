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

  final _dialogKey = GlobalKey<State>();
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
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
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
                            "FName",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.minBlockHorizontal,
                          ),
                          Text(
                            "lName",
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
                        "Male",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical,
                      ),
                      Text(
                        "usman@gmail.com",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical,
                      ),
                      Text(
                        "0902938474",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
