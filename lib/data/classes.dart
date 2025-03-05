import 'package:flutter/material.dart';

enum Level {
  one,
  two,
  three,
  four,
}

enum ExamType {
  opener,
  midTerm,
  endTerm,
}

enum Term {
  one,
  two,
  three,
}

class Program {
  final IconData icon;
  final String title;
  final String body;

  Program({required this.icon, required this.title, required this.body});
}

class Student {
  final String name;
  final String image;
  final int grade;
  final int admNumber;
  final String contact;
  final String parent;
  final List<ExamSubject> results;

  Student(
      {required this.results,
      required this.name,
      required this.image,
      required this.grade,
      required this.admNumber,
      required this.contact,
      required this.parent});
}

class Subject {
  final String name;
  final String teacher;

  Subject({required this.name, required this.teacher});
}

class ExamSubject {
  final Subject subject;
  final int marks;

  ExamSubject({required this.subject, required this.marks});
}

class Stat {
  final String name;
  final int total;
  final IconData icon;

  Stat({required this.name, required this.total, required this.icon});
}

class Exam {
  final Level level;
  final ExamType examtype;
  final Term term;
  final DateTime date;
  final double meanPoints;
  final double meanMarks;
  final int students;
  final String meanGrade;

  Exam(
      {required this.level,
      required this.examtype,
      required this.term,
      required this.date,
      required this.meanPoints,
      required this.meanMarks,
      required this.students,
      required this.meanGrade});
}

class MenuItem {
  final String name;
  final IconData icon;

  MenuItem({required this.name, required this.icon});
}
