import 'package:flutter/material.dart';
import 'package:ischool/config/size_config.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,

      child:const Center(
        child:Text("Students Page"),
      ),
    );
  }
}