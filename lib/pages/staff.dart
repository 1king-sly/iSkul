import 'package:flutter/material.dart';
import 'package:ischool/config/size_config.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,

      child:const Center(
        child:Text("Staff Page"),
      ),
    );
  }
}