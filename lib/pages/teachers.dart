import 'package:flutter/material.dart';
import 'package:ischool/components/student_card.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/providers/teachers_provider.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:ischool/config/responsive.dart';
import 'package:provider/provider.dart';

class Teachers extends StatefulWidget {
  const Teachers({super.key});

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  final List<Student> students = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController;
  }

    @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Consumer<TeachersProvider>(
        builder: (BuildContext context, TeachersProvider value, Widget? child) {
          return Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (_) => value.fetchTeachers(searchController.text),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Search for student",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: AppTheme.accent,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: value.teachers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: Responsive.isTablet(context)
                            ? 4
                            : Responsive.isMobile(context)
                                ? 3.5
                                : 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: Responsive.isTablet(context)
                            ? 2
                            : Responsive.isMobile(context)
                                ? 1
                                : 4,
                      ),
                      itemBuilder: (context, index) => const StudentCard()),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
