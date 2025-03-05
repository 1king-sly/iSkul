import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/utils/app_styles.dart';

class DashboardDrawer extends StatefulWidget {
  final Function(int) onItemSelected;
  const DashboardDrawer({super.key, required this.onItemSelected});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  final List<MenuItem> menuItems = [
    MenuItem(icon: Icons.home_outlined, name: 'Dashboard'),
    MenuItem(icon: Icons.assignment_outlined, name: 'Exams'),
    MenuItem(icon: Icons.group_outlined, name: 'Students'),
    MenuItem(icon: Icons.school_outlined, name: 'Teachers'),
    MenuItem(icon: Icons.widgets_outlined, name: 'Classes'),
    MenuItem(icon: Icons.people_alt_outlined, name: 'Staff'),
    MenuItem(icon: Icons.calendar_today_outlined, name: 'Events'),
    MenuItem(icon: Icons.check_circle_outline, name: 'Attendance'),
  ];

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
            for (int i = 0; i < menuItems.length; i++)
              _buildDrawerItem(menuItems[i].icon, menuItems[i].name, i),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    int activeItem = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        onTap: () {
          setState(() {
            activeItem = widget.onItemSelected(index);
          });

          if (!Responsive.isDesktop(context)) Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: activeItem == index
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
                color:
                    activeItem == index ? Colors.white : Colors.grey.shade700,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color:
                      activeItem == index ? Colors.white : Colors.grey.shade800,
                  fontWeight:
                      activeItem == index ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
