import 'package:flutter/material.dart';
import 'package:ischool/components/calendar.dart';
import 'package:ischool/components/exam_card.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/data/data.dart';
import 'package:ischool/pages/attendance.dart';
import 'package:ischool/pages/classes.dart';
import 'package:ischool/pages/events.dart';
import 'package:ischool/pages/exams.dart';
import 'package:ischool/pages/staff.dart';
import 'package:ischool/pages/teachers.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:ischool/utils/constants.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/students.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
      const DashboardPage(),
      const Exams(),
      const Students(),
      const Teachers(),
      const Classes(),
      const Staff(),
      const Events(),
      const Attendance(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    int setCurrentIndex(int index) {
      setState(() {
        currentIndex = index;
      });
      return currentIndex;
    }

    SizeConfig().init(context);
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      key: _drawerKey,
      drawer: DashboardDrawer(
        onItemSelected: setCurrentIndex,
      ),
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
                child: DashboardDrawer(
                  onItemSelected: setCurrentIndex,
                ),
              ),
            Expanded(
                flex: 9,
                child: SingleChildScrollView(child: screens[currentIndex])),
          ]),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: Responsive.isDesktop(context) ? 3 : 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/hero_bg.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    color: Color.fromARGB(150, 0, 0, 0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(children: [
                                            Container(
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/hero_bg.webp'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            const Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Welcome back, Rajab Zuma",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Manage Exams from the comfort of your phone',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                        const SizedBox(width: 20),
                                        const Spacer(flex: 1),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SchoolStats(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                    const Calendar(),
                ]),
              ),
            ),
            if (Responsive.isDesktop(context)) const SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ExamCard(
                          exam: exams[index],
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: exams.length),
              ),
            ),
          ]),
    );
  }
}

class SchoolStats extends StatelessWidget {
  const SchoolStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: stats.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: Responsive.isTablet(context)
                ? 4
                : Responsive.isMobile(context)
                    ? 3.5
                    : 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                stats[index].total.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(stats[index].name),
              leading:
                  Icon(stats[index].icon, size: 40, color: AppTheme.accent),
              trailing: const Icon(Icons.arrow_right),
            ),
          ),
        ),
      ),
    );
  }
}
