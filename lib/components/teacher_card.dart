import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/utils/app_styles.dart';

class TeacherCard extends StatefulWidget {
  final Teacher teacher;
  const TeacherCard({super.key, required this.teacher});

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.teacher.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(widget.teacher.name, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Text(widget.teacher.contact,
              style: TextStyle(color: AppTheme.primary)),
        ],
      ),
    );
  }
}
