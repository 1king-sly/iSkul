import 'package:flutter/material.dart';
import 'package:ischool/config/size_config.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,

      child:const Center(
        child:Text("Exams Page"),
      ),
    );
  }
}