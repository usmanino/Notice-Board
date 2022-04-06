import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/controller/user_provider.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';
import 'package:noticeboard_system/ui/auth/login/view/login_screen.dart';
import 'package:noticeboard_system/ui/drawer/view/drawer.dart';
import 'package:noticeboard_system/ui/home/widget/admin_lecturer.dart';
import 'package:noticeboard_system/ui/home/widget/admin_student.dart';
import 'package:noticeboard_system/ui/home/widget/lecturer_student.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool logOut = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // FirebaseDatabase.instance
    //     .ref('register/')
    //     .orderByChild('userRole')
    //     .equalTo('Student')
    //     .onValue
    //     .listen(
    //   (event) {
    //     final data = Map<String, dynamic>.from(
    //       event.snapshot.value as Map,
    //     );
    //     data.forEach(
    //       (key, value) {
    //         final nestOrder = Map<String, dynamic>.from(
    //           value as Map,
    //         );
    //       },
    //     );
    //   },
    // );

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
            tabs: [
              if (userProvider.getUserRole['userRole'] == 'Student') ...{
                const Text('  Sent form Admin'),
                const Text('  Sent form Lecturer'),
              } else if (userProvider.getUserRole['userRole'] ==
                  'Lecturer') ...{
                const Text('Inbox'),
                const Text('Outbox'),
              } else ...{
                const Text('Lecturer'),
                const Text('Student'),
              },
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
                  () {
                    setState(() {
                      logOut = false;
                    });
                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        setState(() {
                          logOut = true;
                        });
                      },
                    );
                  },
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
        floatingActionButton: userProvider.getUserRole['userRole'] != 'Student'
            ? FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 7, 90, 79),
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, NoticeBoardScreen.addNotice);
                },
              )
            : Container(),
        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.minBlockHorizontal! * 3,
            ),
            Expanded(
              child: logOut == false
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        if (userProvider.getUserRole['userRole'] ==
                            'Student') ...{
                          const AdminToStudent(),
                          const LecturerToStudent(),
                        } else if (userProvider.getUserRole['userRole'] ==
                            'Lecturer') ...{
                          const AdminLecturer(),
                          const LecturerToStudent(),
                        } else ...{
                          const AdminLecturer(),
                          const AdminToStudent(),
                        },
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
