import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rx_dart/constants/theme/theme.dart';
import 'package:rx_dart/presentation/home/view/home.dart';

import 'injection/provider.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RxDart and Bloc pattern example app',
      theme: appTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
