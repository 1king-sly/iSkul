import 'package:flutter/material.dart';
import 'package:ischool/config/size_config.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,

      child:const Center(
        child:Text("Events Page"),
      ),
    );
  }
}