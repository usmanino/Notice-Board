import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';
import 'package:noticeboard_system/ui/drawer/widget/slide_tiles.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kPrimaryColor,
                    kSecondaryColor,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration:  BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(Assets.me),
                    //       fit: BoxFit.cover,
                    //     ),
                    //     shape: BoxShape.circle,
                    //   ),
                    // ),
                    SizedBox(
                      width: SizeConfig.minBlockHorizontal! * 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'John Wlliems',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                          Text(
                            'Johnwilliems@gmail.com',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor,
                            ),
                            //overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.navigate_next,
                        color: kWhiteColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            SileTiles(
              text: "NoticeBoard",
              icon: Icons.chrome_reader_mode,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Category',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            SileTiles(
              text: "Student",
              icon: Icons.school,
              onTap: () {
                Navigator.pushNamed(context, NoticeBoardScreen.viewStudent);
              },
            ),
            const SizedBox(height: 3),
            SileTiles(
              text: "Lecturer",
              icon: Icons.supervisor_account,
              onTap: () {
                Navigator.pushNamed(context, NoticeBoardScreen.viewlecturer);
              },
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'All labels',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            SileTiles(
              text: "Profile",
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, NoticeBoardScreen.viewAdmin);
              },
            ),
            const SizedBox(height: 3),
            SileTiles(
              text: "About",
              icon: Icons.info_outline,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
