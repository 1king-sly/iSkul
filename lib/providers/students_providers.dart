import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/data/data.dart';

class StudentsProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Student> _students = [];

  bool get isLoading => _isLoading;
  List<Student> get students => _students;

  Future<void> fetchStudents(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _students = dummyStudents
          .where(
            (student) =>
                student.name.toLowerCase().contains(query.toLowerCase()) ||
                student.admNumber
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()),
          )
          .toList();

          _isLoading = false;
    notifyListeners();
    } catch (e) {
      throw Exception("An error Occured trying to query students,$e");
    }
  }
}
