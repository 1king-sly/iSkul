import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
                const Spacer(
                  flex: 1,
                ),
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
                  label: Text('Column A'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Column B'),
                ),
                DataColumn(
                  label: Text('Column C'),
                ),
                DataColumn(
                  label: Text('Column D'),
                ),
                DataColumn(
                  label: Text('Column NUMBERS'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                100,
                (index) => DataRow(cells: [
                  DataCell(Text('A' * (10 - index % 10))),
                  DataCell(Text('B' * (10 - (index + 5) % 10))),
                  DataCell(Text('C' * (15 - (index + 5) % 10))),
                  DataCell(Text('D' * (15 - (index + 10) % 10))),
                  DataCell(Text(((index + 0.1) * 25.4).toString()))
                ]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
