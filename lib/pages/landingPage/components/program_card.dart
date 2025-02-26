import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/utils/app_styles.dart';

class ProgramCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const ProgramCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
                SizeConfig().init(context);

    return Container(
      height: SizeConfig.blockSizeVertical! * 50,
      width: Responsive.isMobile(context)
          ? SizeConfig.blockSizeHorizontal! * 80
          : SizeConfig.blockSizeHorizontal! * 30,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.accent, width: 0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: AppTheme.accent,
            size: 45.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
            ),
          ),
          Expanded(
            child: Text(body),
          )
        ],
      ),
    );
  }
}

