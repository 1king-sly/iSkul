import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/pages/single_student_page.dart';
import 'package:ischool/utils/app_styles.dart';

class StudentCard extends StatefulWidget {
  final Student student;
  final VoidCallback onTap;
  const StudentCard({super.key, required this.student, required this.onTap});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(4.0),
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: AppTheme.primary,
                child: Text(
                  widget.student.name[0],
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            Text(widget.student.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Adm No: "),
                Text(widget.student.admNumber.toString(),
                    style: TextStyle(color: AppTheme.primary)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
