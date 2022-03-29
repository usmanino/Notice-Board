import 'package:flutter/material.dart';
import 'package:noticeboard_system/ui/add_notice/view/add_notice.dart';
import 'package:noticeboard_system/ui/auth/login/view/login.dart';
import 'package:noticeboard_system/ui/auth/registration/view/registration_screen.dart';
import 'package:noticeboard_system/ui/display/view/display.dart';
import 'package:noticeboard_system/ui/home/view/home.dart';
import 'package:noticeboard_system/ui/splash/view/splash.dart';

class NoticeBoardScreen {
  /// The first page when the app loads
  static const String splash = '/';

  static const String login = '/login';

  static const String registration = '/registration';

  static const String home = '/home';

  static const String details = '/details';

  static const String addNotice = '/addNotice';

  static const String viewStudent = '/viewStudent';

  static const String viewlecturer = '/viewlecturer';

  static const String viewAdmin = '/viewAdmin';
}

///The main app routes logic using router generator
class AppRouter {
  ///list of all the app routes
  static Route route(RouteSettings settings) {
    //  final args = settings.arguments;
    switch (settings.name) {
      case NoticeBoardScreen.splash:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case NoticeBoardScreen.login:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const LoginScreen();
          },
        );

      case NoticeBoardScreen.registration:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const RegistrationScreen();
          },
        );

      case NoticeBoardScreen.home:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const HomeScreen();
          },
        );

      case NoticeBoardScreen.details:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const DetailsScreen();
          },
        );

      case NoticeBoardScreen.addNotice:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const AddNoticeScreen();
          },
        );

      case NoticeBoardScreen.viewStudent:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const DisplayStudenScreen();
          },
        );

      case NoticeBoardScreen.viewlecturer:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const DisplayLecturerScreen();
          },
        );

      case NoticeBoardScreen.viewAdmin:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const AdminScreen();
          },
        );

      default:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const Text('Error');
          },
        );
    }
  }
}
