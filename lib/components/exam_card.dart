import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/utils/app_styles.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "Form ${exam.level.name.toUpperCase()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "${exam.examtype.name.toUpperCase()} - (${exam.date.year} TERM ${exam.term.name.toUpperCase()})"),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemBuilder: (context, index) => ExamStats(
                exam: exam,
                index: index,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: AppTheme.accent,
              child: GestureDetector(
                onTap: () {},
                child: const Center(
                  child: Text(
                    "View Analysis",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExamStats extends StatelessWidget {
  final Exam exam;
  final int index;
  const ExamStats({
    super.key,
    required this.exam,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final String title;

    final dynamic stat;

    if (index == 0) {
      title = 'Mean Points';
      stat = exam.meanPoints;
    } else if (index == 1) {
      title = 'Mean Marks';
      stat = exam.meanMarks;
    } else if (index == 2) {
      title = 'Mean Grade';
      stat = exam.meanGrade;
    } else {
      title = 'Students';
      stat = exam.students;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(1.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Text(
            stat.toString(),
            style: TextStyle(
              color: AppTheme.accent,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
