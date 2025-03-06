import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'dart:math';

List<Program> programs = [
  Program(
      title: "Sports",
      body:
          "We provide an intensive and condusive environemant for children to develop their sporting talents and ensure there are no dull Jack's within the institution 😎👌",
      icon: Icons.sports_soccer_outlined),
  Program(
      title: "Academics",
      body:
          "We provide an intensive and condusive environemant for children to develop their sporting talents and ensure there are no dull Jack's within the institution 😎👌",
      icon: Icons.sports_soccer_outlined),
  Program(
      title: "Journalsim",
      body:
          "We provide an intensive and condusive environemant for children to develop their sporting talents and ensure there are no dull Jack's within the institution 😎👌",
      icon: Icons.sports_soccer_outlined),
  Program(
      title: "Music",
      body:
          "We provide an intensive and condusive environemant for children to develop their sporting talents and ensure there are no dull Jack's within the institution 😎👌",
      icon: Icons.sports_soccer_outlined),
];

final subjects = [
  Subject(name: "Mathematics", teacher: "Mr. Johnson"),
  Subject(name: "English", teacher: "Ms. Smith"),
  Subject(name: "Science", teacher: "Dr. Adams"),
  Subject(name: "History", teacher: "Mr. Brown"),
  Subject(name: "Geography", teacher: "Ms. Wilson"),
  Subject(name: "Computer Science", teacher: "Dr. Green"),
  Subject(name: "Physics", teacher: "Mr. White"),
  Subject(name: "Chemistry", teacher: "Ms. Carter"),
  Subject(name: "Biology", teacher: "Dr. Black"),
];

final dummyStudents = [
  Student(
    name: "John Doe",
    admNumber:3424,
    image: "assets/images/john_doe.jpg",
    grade: Level.one,
    contact: "+254712345678",
    parent: "Mr. Doe",
    results: subjects
        .map((subject) =>
            ExamSubject(subject: subject, marks: Random().nextInt(51) + 50))
        .toList(),
  ),
  Student(
    name: "Alice Johnson",
    admNumber:3017,
    image: "assets/images/alice_johnson.jpg",
    grade: Level.four,
    contact: "+254798765432",
    parent: "Mrs. Johnson",
    results: subjects
        .map((subject) =>
            ExamSubject(subject: subject, marks: Random().nextInt(51) + 50))
        .toList(),
  ),
  Student(
    name: "Michael Smith",
    admNumber:2023,
    image: "assets/images/michael_smith.jpg",
    grade: Level.three,
    contact: "+254723456789",
    parent: "Mr. Smith",
    results: subjects
        .map((subject) =>
            ExamSubject(subject: subject, marks: Random().nextInt(51) + 50))
        .toList(),
  ),
  Student(
    name: "Emily Brown",
    admNumber:4052,
    image: "assets/images/emily_brown.jpg",
    grade: Level.two,
    contact: "+254765432123",
    parent: "Mrs. Brown",
    results: subjects
        .map((subject) =>
            ExamSubject(subject: subject, marks: Random().nextInt(51) + 50))
        .toList(),
  ),
  Student(
    name: "Daniel Wilson",
    admNumber:2817,
    image: "assets/images/daniel_wilson.jpg",
    grade: Level.one,
    contact: "+254711122233",
    parent: "Mr. Wilson",
    results: subjects
        .map((subject) =>
            ExamSubject(subject: subject, marks: Random().nextInt(51) + 50))
        .toList(),
  ),
];

final List<Stat> stats = [
  Stat(
    name: "Teachers",
    total: 53,
    icon: Icons.people,
  ),
  Stat(
    name: "Students",
    total: 868,
    icon: Icons.school,
  ),
  Stat(
    name: "Staff",
    total: 19,
    icon: Icons.badge,
  ),
  Stat(
    name: "Streams",
    total: 20,
    icon: Icons.meeting_room,
  ),
];

List<Exam> generateExams() {
  DateTime examDate = DateTime(2025, 2, 26); // Same date for all exams

  List<Map<String, dynamic>> examData = [
    {"level": Level.one, "meanPoints": 3.5, "meanMarks": 40.5, "students": 220, "meanGrade": "C"},
    {"level": Level.two, "meanPoints": 3.2, "meanMarks": 36.7, "students": 209, "meanGrade": "D+"},
    {"level": Level.three, "meanPoints": 2.8, "meanMarks": 34.7, "students": 176, "meanGrade": "D"},
    {"level": Level.four, "meanPoints": 2.1, "meanMarks": 30.6, "students": 413, "meanGrade": "D-"},
  ];

  return examData.map((data) {
    return Exam(
      level: data["level"],
      examtype: ExamType.opener,
      term: Term.one,
      date: examDate,
      meanPoints: data["meanPoints"],
      meanMarks: data["meanMarks"],
      students: data["students"],
      meanGrade: data["meanGrade"],
    );
  }).toList();
}

final List<Exam> exams = generateExams();




List<String> teacherNames = [
  "Mr. Johnson",
  "Ms. Smith",
  "Dr. Adams",
  "Mr. Brown",
  "Ms. Wilson",
  "Dr. Green",
  "Mr. White",
  "Ms. Carter",
  "Dr. Black",
];

List<String> subjectNames = [
  "Mathematics",
  "English",
  "Science",
  "History",
  "Geography",
  "Computer Science",
  "Physics",
  "Chemistry",
  "Biology",
];

List<String> teacherImages = [
  "assets/images/teacher1.jpg",
  "assets/images/teacher2.jpg",
  "assets/images/teacher3.jpg",
  "assets/images/teacher4.jpg",
  "assets/images/teacher5.jpg",
  "assets/images/teacher6.jpg",
  "assets/images/teacher7.jpg",
  "assets/images/teacher8.jpg",
  "assets/images/teacher9.jpg",
];

List<Teacher> generateTeachers() {
  Random random = Random();
  return List.generate(teacherNames.length, (index) {
    return Teacher(
      name: teacherNames[index],
      subject: subjectNames[index],
      contact: "+2547${random.nextInt(90000000) + 1000000}",
      image: "assets/images/hero_bg.webp",
    );
  });
}

final List<Teacher> dummyTeachers = generateTeachers();
