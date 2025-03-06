import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/utils/app_styles.dart';

class SingleStudentPage extends StatefulWidget {
  final Student? student;
  final VoidCallback onBack;

  const SingleStudentPage({super.key, this.student, required this.onBack});

  @override
  State<SingleStudentPage> createState() => _SingleStudentPageState();
}

String generateGrade(int marks) {
  String grade;

  switch (marks ~/ 10) {
    case 10:
    case 9:
    case 8:
      grade = 'A';
      break;
    case 7:
      grade = 'B';
      break;
    case 6:
      grade = 'C';
      break;
    case 5:
      grade = 'D';
      break;
    default:
      grade = 'F';
      break;
  }

  return grade;
}

String generateRemarks(int marks) {
  String remarks;

  switch (marks ~/ 10) {
    case 10:
    case 9:
    case 8:
      remarks = 'Excellent Work';
      break;
    case 7:
      remarks = 'Good work';
      break;
    case 6:
      remarks = 'Can do better';
      break;
    case 5:
      remarks = 'Aim higher';
      break;
    default:
      remarks = 'Put more effort';
      break;
  }

  return remarks;
}

class _SingleStudentPageState extends State<SingleStudentPage> {
  @override
  Widget build(BuildContext context) {
    final Student user = widget.student!;
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: Colors.white,
          ),
          child: Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Text(
                      user.name[0],
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name: ${user.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Admission Number: ${user.admNumber}",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Form: ${user.grade.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                if (Responsive.isDesktop(context))
                  const Spacer(
                    flex: 1,
                  ),
                if (!Responsive.isDesktop(context)) const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Parent: ${user.parent}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contact: ${user.contact}",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text('Name'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Marks'),
                ),
                DataColumn(
                  label: Text('Grade'),
                ),
                DataColumn(
                  label: Text('Teacher'),
                ),
                DataColumn(
                  label: Text('Remarks'),
                ),
              ],
              rows: List<DataRow>.generate(
                user.results.length,
                (index) => DataRow(
                    color: WidgetStatePropertyAll(
                        index % 2 == 0 ? Colors.grey.shade300 : Colors.white),
                    cells: [
                      DataCell(Text(user.results[index].subject.name)),
                      DataCell(Text(user.results[index].marks.toString())),
                      DataCell(Text(generateGrade(user.results[index].marks))),
                      DataCell(Text(user.results[index].subject.teacher)),
                      DataCell(Text(generateRemarks(user.results[index].marks)))
                    ]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
