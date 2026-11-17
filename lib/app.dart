import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/intro/intro_animation_screen.dart';

class SmartAttendanceApp extends StatelessWidget {
  const SmartAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Attendance',
      theme: AppTheme.theme,
      home: const IntroAnimationScreen(),
    );
  }
}