import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/landingPage/components/login_btn.dart';
import 'package:ischool/utils/app_styles.dart';

class HeroSection extends StatelessWidget {
  final void Function()? toggleVisibility;

  const HeroSection({super.key, required this.toggleVisibility});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth!,
      height: SizeConfig.screenHeight!,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/hero_bg.webp'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
          Container(
            width: double.infinity,
            alignment: const Alignment(-0.7, 0),
            child: Container(
              height: Responsive.isMobile(context)
                  ? SizeConfig.blockSizeVertical! * 90
                  : SizeConfig.blockSizeVertical! * 50,
              width: Responsive.isMobile(context)
                  ? SizeConfig.blockSizeHorizontal! * 90
                  : SizeConfig.blockSizeHorizontal! * 40,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      height: 5,
                      color: AppTheme.accent,
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/logo.webp',
                        fit: BoxFit.cover,
                        width: 45,
                        height: 45,
                      ),
                      title: const Expanded(
                        flex: 1,
                        child: Text(
                          "KINGSLY",
                          style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: const Text(
                        "Academy",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Text(
                      "Re-writing the future",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    LoginBtn(
                      toggleVisibility: toggleVisibility,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
