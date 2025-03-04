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
    image: "assets/images/john_doe.jpg",
    grade: 10,
    contact: "+254712345678",
    parent: "Mr. Doe",
    results: subjects.map((subject) => ExamSubject(subject: subject, marks: Random().nextInt(51) + 50)).toList(),
  ),
  Student(
    name: "Alice Johnson",
    image: "assets/images/alice_johnson.jpg",
    grade: 11,
    contact: "+254798765432",
    parent: "Mrs. Johnson",
    results: subjects.map((subject) => ExamSubject(subject: subject, marks:Random().nextInt(51) + 50)).toList(),
  ),
  Student(
    name: "Michael Smith",
    image: "assets/images/michael_smith.jpg",
    grade: 9,
    contact: "+254723456789",
    parent: "Mr. Smith",
    results: subjects.map((subject) => ExamSubject(subject: subject, marks:Random().nextInt(51) + 50)).toList(),
  ),
  Student(
    name: "Emily Brown",
    image: "assets/images/emily_brown.jpg",
    grade: 12,
    contact: "+254765432123",
    parent: "Mrs. Brown",
    results: subjects.map((subject) => ExamSubject(subject: subject, marks: Random().nextInt(51) + 50)).toList(),
  ),
  Student(
    name: "Daniel Wilson",
    image: "assets/images/daniel_wilson.jpg",
    grade: 10,
    contact: "+254711122233",
    parent: "Mr. Wilson",
    results: subjects.map((subject) => ExamSubject(subject: subject, marks: Random().nextInt(51) + 50)).toList(),
  ),
];