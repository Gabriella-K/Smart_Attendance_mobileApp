import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth/welcome_screen.dart';

class IntroAnimationScreen extends StatefulWidget {
  const IntroAnimationScreen({super.key});

  @override
  State<IntroAnimationScreen> createState() =>
      _IntroAnimationScreenState();
}

class _IntroAnimationScreenState extends State<IntroAnimationScreen> {
  int currentScene = 0;

  final scenes = [
    'assets/animations/student_walking.json',
    'assets/animations/student_scanning.json',
    'assets/animations/attendance_success.json',
  ];

  final titles = [
    'Show up.',
    'Scan in.',
    'Attendance done.',
  ];

  final descriptions = [
    'Your classes, your attendance.',
    'Check in before the moment passes.',
    'Your attendance has been recorded.',
  ];

  void nextScene(Duration animationDuration) {
    Future.delayed(animationDuration, () {
      if (!mounted) return;

      if (currentScene < scenes.length - 1) {
        setState(() {
          currentScene++;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const WelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F3),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            Expanded(
              flex: 6,
              child: Center(
                child: Lottie.asset(
                  scenes[currentScene],
                  key: ValueKey(currentScene),
                  fit: BoxFit.contain,
                  repeat: false,

                  onLoaded: (composition) {
                    nextScene(composition.duration);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              titles[currentScene],
              style: const TextStyle(
                color: Color(0xFF1F2A44),
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              descriptions[currentScene],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF706B62),
                fontSize: 15,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                scenes.length,
                    (index) {
                  final active = index == currentScene;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: active ? 22 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: active
                          ? const Color(0xFFC6A75E)
                          : const Color(0xFFE8DCC8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}