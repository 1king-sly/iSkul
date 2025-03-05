import 'package:flutter/material.dart';
import 'package:ischool/config/size_config.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,

      child:const Center(
        child:Text("Classes Page"),
      ),
    );
  }
}