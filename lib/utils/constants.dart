import 'package:flutter/material.dart';
import 'package:ischool/utils/app_styles.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  String activeItem = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        color: Colors.grey.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.webp', width: 100, height: 100),
            _buildDrawerItem(Icons.home_outlined, "Dashboard"),
            _buildDrawerItem(Icons.calendar_today_outlined, "Calendar"),
            _buildDrawerItem(Icons.widgets_outlined, "Classes"),
            _buildDrawerItem(Icons.group_outlined, "Students"),
            _buildDrawerItem(Icons.school_outlined, "Teachers"),
            _buildDrawerItem(Icons.people_alt_outlined, "Staff"),
            _buildDrawerItem(Icons.assignment_outlined, "Exams"),
            _buildDrawerItem(Icons.check_circle_outline, "Attendance"),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    bool isSelected = activeItem == title;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        onTap: () {
          setState(() {
            activeItem = title;
          });
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: isSelected
              ? BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                )
              : null,
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade800,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
