import 'package:flutter/material.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({super.key});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.white,
      ),
    );
  }
}
