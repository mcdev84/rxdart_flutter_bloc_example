import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/theme/theme.dart';
import 'package:rx_dart/router/router.dart';

import 'injection/provider.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.instance.get<AuthenticationBloc>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'RxDart and Bloc pattern example app',
      theme: appTheme,
      themeMode: ThemeMode.system,
    );
  }
}
