import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/utils/app_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
            SizeConfig().init(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: Responsive.isMobile(context)
          ? SizeConfig.screenHeight! * 0.9
          : SizeConfig.screenHeight! * 0.7,
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Responsive.isMobile(context)
          ? Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 4,
                                color: AppTheme.accent,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: Row(children: [
                                  const Text(
                                    "About",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Us",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: AppTheme.accent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                        const SizedBox(height: 10),
                        const Text(
                          "At Kingsly Academy, we are dedicated to transforming the way educational institutions operate by providing an efficient, user-friendly, and secure school management system. Our platform streamlines administrative tasks, enhances communication, and ensures seamless collaboration between students, teachers, parents, and administrators.",
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hero_bg.webp")),
                    ),
                  ),
                ),
              ],
            )
          : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 4,
                              color: AppTheme.accent,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Row(children: [
                                const Text(
                                  "About",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Us",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppTheme.accent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                            ),
                          ]),
                      const SizedBox(height: 10),
                      const Text(
                          "At Kingsly Academy, we are dedicated to transforming the way educational institutions operate by providing an efficient, user-friendly, and secure school management system. Our platform streamlines administrative tasks, enhances communication, and ensures seamless collaboration between students, teachers, parents, and administrators."),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/hero_bg.webp")),
                  ),
                ),
              ),
            ]),
    );
  }
}

