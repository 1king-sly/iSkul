import 'package:flutter/material.dart';
import 'package:ischool/components/student_card.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/pages/single_student_page.dart';
import 'package:ischool/providers/students_providers.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:ischool/config/responsive.dart';
import 'package:provider/provider.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final List<Student> students = [];
  final PageController _pageController = PageController(initialPage: 0);
  Student? selectedStudent;

  void showStudentDetails(Student student) {
    setState(() {
      selectedStudent = student;
    });
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goBackToList() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Expanded(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            StudentsListScreen(onStudentTap: showStudentDetails),
            SingleStudentPage(student: selectedStudent, onBack: goBackToList),
          ],
        ),
      ),
    );
  }
}

class StudentsListScreen extends StatefulWidget {
  final Function(Student) onStudentTap;
  const StudentsListScreen({super.key, required this.onStudentTap});

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
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
    List<Student> students = [];

    if (searchController.text.isEmpty) {
      students = [];
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Consumer<StudentsProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (_) async {
                  students = await value.fetchStudents(searchController.text);
                },
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.grey, size: 25),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Search for student",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: AppTheme.accent),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: students.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: Responsive.isTablet(context)
                          ? 2
                          : Responsive.isMobile(context)
                              ? 2
                              : 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: Responsive.isTablet(context)
                          ? 2
                          : Responsive.isMobile(context)
                              ? 1
                              : 4,
                    ),
                    itemBuilder: (context, index) => StudentCard(
                      student: students[index],
                      onTap: () => widget.onStudentTap(students[index]),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
