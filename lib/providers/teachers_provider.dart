import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/data/data.dart';

class TeachersProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Teacher> _teachers = [];

  bool get isLoading => _isLoading;
  List<Teacher> get teachers => _teachers;

  Future<void> fetchTeachers(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _teachers = dummyTeachers
          .where(
            (teacher) =>
                teacher.name.toLowerCase().contains(query.toLowerCase()) ||
                teacher.subject
                    .toLowerCase()
                    .contains(query.toLowerCase()),
          )
          .toList();

          _isLoading = false;
    notifyListeners();
    } catch (e) {
      throw Exception("An error Occured trying to query teachers,$e");
    }
  }
}
