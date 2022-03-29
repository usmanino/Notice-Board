import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';

class ExpiredScreen extends StatefulWidget {
  const ExpiredScreen({Key? key}) : super(key: key);

  @override
  State<ExpiredScreen> createState() => _ExpiredScreenState();
}

class _ExpiredScreenState extends State<ExpiredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, NoticeBoardScreen.details);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "20 Mar 2022",
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
                      "Subtiel",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical,
                    ),
                    Row(
                      children: [
                        Text(
                          "posted by ",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Factorial",
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
          },
        ),
      ),
    );
  }
}
