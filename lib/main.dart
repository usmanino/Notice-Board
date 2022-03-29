import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noticeboard_system/app.dart';
import 'package:noticeboard_system/controller/controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const App(),
    ),
  );
}
