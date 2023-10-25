import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AnimatedTheme appAnimatedTheme(Widget child) =>
    AnimatedTheme(data: appTheme, child: child);

final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
        titleSmall:
            GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold),
        titleMedium:
            GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
        titleLarge:
            GoogleFonts.ubuntu(fontSize: 26, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.ubuntu(),
        bodyMedium: GoogleFonts.ubuntu(),
        bodyLarge: GoogleFonts.ubuntu()),
    cardTheme: const CardTheme(color: Colors.lime, elevation: 6),
    searchBarTheme: SearchBarThemeData(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.lime),
        elevation: MaterialStateProperty.resolveWith((states) => 6)),
    colorScheme: ColorScheme.fromSwatch(
        errorColor: Colors.redAccent,
        primarySwatch: Colors.teal,

        ///brightness: Brightness.light,
        /// cardColor: Colors.lime,
        ///backgroundColor: Colors.lime,
        accentColor: Colors.indigoAccent),
    scaffoldBackgroundColor: Colors.teal);
