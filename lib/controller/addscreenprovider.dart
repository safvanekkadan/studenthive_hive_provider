import 'package:flutter/material.dart';
import 'package:mini/controller/dbfunctions.dart';
import 'package:provider/provider.dart';

import '../model/person.dart';
import '../view/listscreen/listscreen.dart';

class AddScreenProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController clsController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> onbuttonclikedaddStudent(context) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final cls = clsController.text.trim();
    final address = addressController.text.trim();

    if (name.isEmpty || age.isEmpty || cls.isEmpty || address.isEmpty) {
      return;
    } else {
      final student = Person(name: name, age: age, cls: cls, address: address);

     

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ListStudentWidget(),
        ),
      );
      Provider.of<DBProvider>(context, listen: false)
          .addStudent(student);
      
    }
  }
}
