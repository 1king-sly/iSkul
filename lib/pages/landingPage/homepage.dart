import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/landingPage/components/about_section.dart';
import 'package:ischool/pages/landingPage/components/authmodal.dart';
import 'package:ischool/pages/landingPage/components/contact_section.dart';
import 'package:ischool/pages/landingPage/components/hero_section.dart';
import 'package:ischool/pages/landingPage/components/login_btn.dart';
import 'package:ischool/pages/landingPage/components/program_section.dart';
import 'package:ischool/utils/app_styles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SizeConfig().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void toggleVisibility() {
      setState(() {
        isVisible = !isVisible;
      });
    }

    // ignore: avoid_types_as_parameter_names
    void closeVisibility(PointerDownEvent) {
      setState(() {
        isVisible = false;
      });
    }

    return Scaffold(
      drawer: Responsive.isDesktop(context)
          ? null
          : Drawer(
              shadowColor: AppTheme.accent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.webp'),
                    const SizedBox(height: 20.0),
                    const ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text("Home"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("About"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.widgets_outlined),
                      title: Text("Programs"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.contacts_outlined),
                      title: Text("Contacts"),
                    ),
                  ]),
            ),
      backgroundColor: AppTheme.white,
      appBar: AppBar(surfaceTintColor: Colors.white, actions: [
        if (Responsive.isDesktop(context))
          Expanded(
            flex: 9,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/images/logo.webp'),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text('Home'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('About'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('Programs'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('Contacts'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        if (!Responsive.isDesktop(context)) const Spacer(flex: 3),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(Responsive.isMobile(context) ? 1 : 5.0),
            child: LoginBtn(
              toggleVisibility: toggleVisibility,
            ),
          ),
        ),
      ]),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              HeroSection(
                toggleVisibility: toggleVisibility,
              ),
              const SizedBox(height: 10),
              const AboutSection(),
              const SizedBox(height: 10),
              const ProgramSection(),
              const SizedBox(height: 10),
              const ContactSection(),
            ]),
          ),
          if (isVisible)
            AuthModal(
              onTapOutside: closeVisibility,
            ),
        ],
      ),
    );
  }
}
