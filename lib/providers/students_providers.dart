import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';

class StudentsProviders with ChangeNotifier {
  final bool _isLoading = false;
  final List<Student> _students = [];

  bool get isLoading => _isLoading;
  List<Student> get students => _students;
}
