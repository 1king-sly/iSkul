// ignore_for_file: camel_case_types, unused_element

import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/utils/app_styles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SizeConfig().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isDesktop(context)
          ? null
          : Drawer(
              shadowColor: AppTheme.accent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/logo.webp'),
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
                  child: Image.asset('images/logo.webp'),
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
            child: const _loginBtn(),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          const _hero_section(),
          const SizedBox(height: 10),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 10),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Colors.green.shade300,
          ),
          const SizedBox(height: 10),
          const _contact_section(),
        ]),
      ),
    );
  }
}

class _contact_section extends StatelessWidget {
  const _contact_section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Row(children: [
          Expanded(
            flex: 1,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Send a message"),
              const Text(
                "Contact Form",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              _contactFormField(
                controller: nameController,
                labelText: 'Your Name',
                prefixIcon: const Icon(Icons.person_2_outlined),
              ),
              const SizedBox(height: 10),
              _contactFormField(
                controller: emailController,
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 10),
              _contactFormField(
                controller: messageController,
                labelText: 'Message Content',
                maxLines: 5,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppTheme.accent),
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0))),
                child: const Text(
                  "Send Message",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("We are Kingsly Academy"),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const ListTile(
                leading: Icon(
                  Icons.directions,
                ),
                title: Text("Off Likoni -Mtongwe roads - Mombasa, Kenya"),
              ),
              const SizedBox(
                height: 5,
              ),
              const ListTile(
                leading: Icon(
                  Icons.email_outlined,
                ),
                title: Text("kinslybyrone17@gmail.com"),
              ),
              const SizedBox(
                height: 5,
              ),
              const ListTile(
                leading: Icon(
                  Icons.call_outlined,
                ),
                title: Text("+254720041750"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook_outlined)),
                const SizedBox(width: 5),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.discord_outlined)),
                const SizedBox(width: 5),
              ])
            ]),
          ),
        ]),
      ),
    );
  }
}

class _contactFormField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String labelText;
  const _contactFormField({
    required this.controller,
    this.prefixIcon,
    this.maxLines,
    this.keyboardType,
    required this.labelText,
  });

  // @override
  // void dispose() {
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        fillColor: AppTheme.white,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.all(15),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
        ),
        hoverColor: Colors.transparent,
        prefixIconColor: Colors.grey.shade500,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.accent,
          ),
        ),
      ),
    );
  }
}

class _hero_section extends StatelessWidget {
  const _hero_section();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth!,
      height: SizeConfig.screenHeight!,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/hero_bg.webp'), fit: BoxFit.cover),
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
              height: SizeConfig.blockSizeVertical! * 50,
              width: SizeConfig.blockSizeHorizontal! * 40,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 10,
                      height: 5,
                      color: AppTheme.accent,
                    ),
                    ListTile(
                        leading: Image.asset(
                          'images/logo.webp',
                          fit: BoxFit.cover,
                        ),
                        title: const Text(
                          "KINGSLY",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        subtitle: const Text("Academy")),
                    const Text(
                      "Re-writing the future",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const _loginBtn(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _loginBtn extends StatelessWidget {
  const _loginBtn();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: AppTheme.accent,
          ),
        ),
      ),
      child: Text(
        "Login",
        style: TextStyle(fontSize: Responsive.isMobile(context) ? 10 : 16),
      ),
    );
  }
}
