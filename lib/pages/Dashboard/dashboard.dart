import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:ischool/utils/constants.dart';
import 'package:ischool/config/size_config.dart';
import 'package:table_calendar/table_calendar.dart';

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
      drawer: const DashboardDrawer(),
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
              const Expanded(
                flex: 2,
                child: DashboardDrawer(),
              ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.yellow,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TableCalendar(
                                      firstDay: DateTime.utc(2010, 10, 16),
                                      lastDay: DateTime.utc(2030, 3, 14),
                                      focusedDay: DateTime.now(),
                                      calendarStyle: const CalendarStyle(
                                        todayTextStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        todayDecoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                        ),
                                        selectedTextStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        selectedDecoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                        ),
                                      )),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            color: Colors.blue,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
