import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 40,
            ),

            child: Column(
              children: [
                const SizedBox(height: 28),

                // App logo
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.navy,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: AppColors.gold,
                        size: 26,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      'Smart Attendance',
                      style: GoogleFonts.poppins(
                        color: AppColors.navy,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 55),

                // Illustration
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    color: AppColors.beige.withOpacity(0.45),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.phone_android_rounded,
                    color: AppColors.navy,
                    size: 100,
                  ),
                ),

                const SizedBox(height: 35),

                // Main heading
                Text(
                  'Welcome to\nSmart Attendance',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.navy,
                    fontSize: 28,
                    height: 1.15,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  'Make every class count.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Check in, keep track of your attendance, '
                        'and stay on top of your classes.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: AppColors.mutedText,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 38),

                // Log in
                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navy,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Create account
                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.navy,
                      side: const BorderSide(
                        color: AppColors.navy,
                        width: 1.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Create account',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  'Your classes. Your attendance. One place.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}