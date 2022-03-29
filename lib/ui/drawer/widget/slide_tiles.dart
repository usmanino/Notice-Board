import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';

class SileTiles extends StatelessWidget {
  IconData icon;
  String text;
  GestureTapCallback onTap;
  SileTiles({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 15,
          bottom: 15,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: const Color(0xFF333333),
            ),
            SizedBox(
              width: SizeConfig.minBlockHorizontal! * 5,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF333333),
              ),
            )
          ],
        ),
      ),
    );
  }
}
