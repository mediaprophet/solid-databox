import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seraphim/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: SeraphimApp()));
}

class SeraphimApp extends StatelessWidget {
  const SeraphimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seraphim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD67D59), // Warm terracotta
          secondary: const Color(0xFF6B8F71), // Calm sage green
          surface: const Color(0xFFFBF8F1), // Warm cream
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD67D59),
          secondary: const Color(0xFF6B8F71),
          surface: const Color(0xFF2C272E), // Deep warm charcoal
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Supports High Contrast via OS
      routerConfig: appRouter,
    );
  }
}
