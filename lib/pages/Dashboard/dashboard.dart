import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:ischool/utils/constants.dart';
import 'package:ischool/config/size_config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      key: _drawerKey,
      drawer: dashBoardDrawer,
      backgroundColor: AppTheme.white,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu_outlined, color: AppTheme.primary),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: dashBoardDrawer,
              ),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: const SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Dashboard")]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
