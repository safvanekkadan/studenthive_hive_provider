import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/model/person.dart';

const transactionDbName = 'student_db';

class DBProvider extends ChangeNotifier {
  List<Person> studentList = [];


  Future<void> addStudent(Person value) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    final id = await studentDB.add(value);
    value.id = id;

    getAllStudents();
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    studentList.clear();
    studentList.addAll(studentDB.values);
    notifyListeners();
   
  }

  Future<void> deleteStudent(index) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    await studentDB.delete(index);
    notifyListeners();
    getAllStudents();
  }

  Future<void> editstudent(index, Person value) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    studentList.clear();
    studentList.addAll(studentDB.values);
    studentDB.putAt(index, value);
    notifyListeners();
    getAllStudents();
 
  }
}
