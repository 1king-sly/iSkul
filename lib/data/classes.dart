import 'package:flutter/material.dart';

class Program {
   final IconData icon;
  final String title;
  final String body;

  Program({required this.icon,required this.title, required this.body});
}


class Student{
  final String name;
  final String image;
  final int grade;
  final String contact;
  final String parent;
  final List<ExamSubject> results;
  

  Student( {required this.results,required this.name, required this.image, required this.grade, required this.contact, required this.parent});
  
}

class Subject{
  final String name;
  final String teacher;

  Subject({required this.name, required this.teacher});
}

class ExamSubject {
  final Subject subject;
  final int marks;

  ExamSubject({required this.subject, required this.marks});
}



