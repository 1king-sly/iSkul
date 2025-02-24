import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/utils/app_styles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
      appBar: AppBar(actions: [
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
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: AppTheme.accent,
                    ),
                  ),
                ),
                child: const Text("Login")),
          ),
        ),
      ]),
    );
  }
}
