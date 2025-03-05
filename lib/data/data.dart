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

final students = [
  Student(
    name: "John Doe",
    admNumber:3424,
    image: "assets/images/john_doe.jpg",
    grade: 10,
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
    grade: 11,
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
    grade: 9,
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
    grade: 12,
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
    grade: 10,
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
