import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../student/student_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedRole = 'Student';
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.navy,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 15, 28, 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create account',
                style: GoogleFonts.poppins(
                  color: AppColors.navy,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Set up your Smart Attendance account.',
                style: GoogleFonts.inter(
                  color: AppColors.mutedText,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 28),

              _label('I am a'),

              const SizedBox(height: 10),

              Row(
                children: [
                  _roleButton('Student'),
                  const SizedBox(width: 12),
                  _roleButton('Lecturer'),
                ],
              ),

              const SizedBox(height: 22),

              _label('Full name'),
              const SizedBox(height: 8),

              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),

              const SizedBox(height: 18),

              _label(
                selectedRole == 'Student'
                    ? 'Student ID'
                    : 'Staff ID',
              ),

              const SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  hintText: selectedRole == 'Student'
                      ? 'Enter your student ID'
                      : 'Enter your staff ID',
                  prefixIcon: const Icon(
                    Icons.badge_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              _label('University email'),
              const SizedBox(height: 8),

              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your university email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 18),

              _label('Password'),
              const SizedBox(height: 8),

              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Create a password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedRole == 'Student') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StudentDashboard(),
                        ),
                      );
                    }
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
                    'Create account',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: Text(
                  'By continuing, you agree to the app terms.',
                  style: GoogleFonts.inter(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(String role) {
    final selected = selectedRole == role;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.navy
                : AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? AppColors.navy
                  : AppColors.beige,
            ),
          ),
          child: Center(
            child: Text(
              role,
              style: GoogleFonts.inter(
                color: selected
                    ? Colors.white
                    : AppColors.navy,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: AppColors.darkText,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}