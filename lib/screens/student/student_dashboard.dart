import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() =>
      _StudentDashboardState();
}

class _StudentDashboardState
    extends State<StudentDashboard> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,

      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            StudentHomeTab(),
            CoursesTab(),
            ScanTab(),
            HistoryTab(),
            ProfileTab(),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        indicatorColor: AppColors.beige,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Courses',
          ),

          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner_rounded),
            selectedIcon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),

          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            selectedIcon: Icon(Icons.history_rounded),
            label: 'History',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class StudentHomeTab extends StatelessWidget {
  const StudentHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning,',
                      style: GoogleFonts.inter(
                        color: AppColors.mutedText,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Gabriella 👋',
                      style: GoogleFonts.poppins(
                        color: AppColors.navy,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Attendance card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(24),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall attendance',
                  style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                    Text(
                      '86%',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Padding(
                      padding:
                      const EdgeInsets.only(bottom: 9),
                      child: Text(
                        'Good standing',
                        style: GoogleFonts.inter(
                          color: AppColors.gold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: 0.86,
                    minHeight: 8,
                    backgroundColor:
                    Colors.white.withOpacity(0.15),
                    valueColor:
                    const AlwaysStoppedAnimation(
                      AppColors.gold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Text(
            "Today's classes",
            style: GoogleFonts.poppins(
              color: AppColors.navy,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          const ClassCard(
            course: 'Web Technology',
            time: '09:00 AM',
            status: 'Present',
            statusColor: AppColors.success,
          ),

          const SizedBox(height: 12),

          const ClassCard(
            course: 'Software Engineering',
            time: '02:00 PM',
            status: 'Upcoming',
            statusColor: AppColors.gold,
          ),

          const SizedBox(height: 30),

          Text(
            'Quick actions',
            style: GoogleFonts.poppins(
              color: AppColors.navy,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: QuickAction(
                  icon: Icons.qr_code_scanner_rounded,
                  title: 'Scan',
                  onTap: () {},
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: QuickAction(
                  icon: Icons.menu_book_rounded,
                  title: 'Courses',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String course;
  final String time;
  final String status;
  final Color statusColor;

  const ClassCard({
    super.key,
    required this.course,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.beige.withOpacity(0.55),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: AppColors.navy,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: GoogleFonts.inter(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  time,
                  style: GoogleFonts.inter(
                    color: AppColors.mutedText,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: GoogleFonts.inter(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const QuickAction({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.navy,
              size: 28,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: GoogleFonts.inter(
                color: AppColors.darkText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimplePage(
      title: 'My courses',
      subtitle: 'Track your attendance by course.',
      child: Column(
        children: const [
          CourseCard(
            course: 'Web Technology',
            attendance: '86%',
          ),
          SizedBox(height: 12),
          CourseCard(
            course: 'Software Engineering',
            attendance: '92%',
          ),
          SizedBox(height: 12),
          CourseCard(
            course: 'Database Systems',
            attendance: '71%',
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String course;
  final String attendance;

  const CourseCard({
    super.key,
    required this.course,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    final value =
    int.parse(attendance.replaceAll('%', ''));

    final color = value < 75
        ? AppColors.warning
        : AppColors.success;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              course,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Text(
            attendance,
            style: GoogleFonts.poppins(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ScanTab extends StatelessWidget {
  const ScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimplePage(
      title: 'Scan attendance',
      subtitle: 'Scan your lecturer’s QR code to check in.',
      child: Container(
        width: double.infinity,
        height: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.gold,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(
                Icons.qr_code_scanner_rounded,
                size: 100,
                color: AppColors.navy,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Ready to scan',
              style: GoogleFonts.poppins(
                color: AppColors.navy,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Make sure you are on campus.',
              style: GoogleFonts.inter(
                color: AppColors.mutedText,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimplePage(
      title: 'Attendance history',
      subtitle: 'Your recent attendance records.',
      child: Column(
        children: [
          _historyItem(
            'Web Technology',
            'November 17 · 09:02 AM',
            'Present',
            AppColors.success,
          ),

          _historyItem(
            'Software Engineering',
            'November 16 · 02:01 PM',
            'Present',
            AppColors.success,
          ),

          _historyItem(
            'Database Systems',
            'November 14 · 09:18 AM',
            'Late',
            AppColors.warning,
          ),

          _historyItem(
            'Web Technology',
            'November 13 · 09:00 AM',
            'Present',
            AppColors.success,
          ),
        ],
      ),
    );
  }

  Widget _historyItem(
      String course,
      String date,
      String status,
      Color color,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              status == 'Present'
                  ? Icons.check_rounded
                  : Icons.access_time_rounded,
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  date,
                  style: GoogleFonts.inter(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Text(
            status,
            style: GoogleFonts.inter(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimplePage(
      title: 'Profile',
      subtitle: 'Manage your Smart Attendance account.',
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.beige,
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.navy,
                    size: 32,
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gabriella Ucyeye',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Software Engineering · Student',
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          _profileOption(
            Icons.settings_outlined,
            'Account settings',
          ),

          _profileOption(
            Icons.notifications_none_rounded,
            'Notifications',
          ),

          _profileOption(
            Icons.help_outline_rounded,
            'Help & support',
          ),

          _profileOption(
            Icons.logout_rounded,
            'Log out',
          ),
        ],
      ),
    );
  }

  Widget _profileOption(
      IconData icon,
      String title,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.navy,
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.mutedText,
        ),
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SimplePage({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.navy,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: AppColors.mutedText,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 25),

          child,
        ],
      ),
    );
  }
}