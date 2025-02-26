import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/data/data.dart';
import 'package:ischool/pages/landingPage/components/program_card.dart';
import 'package:ischool/utils/app_styles.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.7,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 40, vertical: 20),
      alignment: const Alignment(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Our",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text(
              "Programs",
              style: TextStyle(
                fontSize: 24,
                color: AppTheme.accent,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.5,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: programs.length,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  Program program = programs[index];
                  return ProgramCard(
                    icon: program.icon,
                    title: program.title,
                    body: program.body,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

