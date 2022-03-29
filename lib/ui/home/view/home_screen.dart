import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';
import 'package:noticeboard_system/ui/drawer/view/drawer.dart';
import 'package:noticeboard_system/ui/home/widget/expired_screen.dart';
import 'package:noticeboard_system/ui/home/widget/ongoing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const SideNav(),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 14, 182, 159),
          leading: InkResponse(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: kWhiteColor,
            ),
          ),
          bottom: TabBar(
            labelPadding: const EdgeInsets.only(top: 10, bottom: 20),
            labelStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: kDangerColor,
            tabs: const [
              Text('ONGOING'),
              Text('EXPIRED'),
            ],
          ),
          title: Text(
            'NoticeBoard',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kWhiteColor,
            ),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                  'Log Out',
                  () {},
                ),
                _buildPopupMenuItem(
                  'Contact us',
                  () {},
                ),
              ],
            ),
            SizedBox(
              width: SizeConfig.minBlockHorizontal! * 4,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 7, 90, 79),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, NoticeBoardScreen.addNotice);
          },
        ),
        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.minBlockHorizontal! * 3,
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OngoingScreen(),
                  ExpiredScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, VoidCallback onTap) {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: onTap,
        child: Text(title),
      ),
    );
  }
}
