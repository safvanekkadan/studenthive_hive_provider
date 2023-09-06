import 'package:flutter/material.dart';
import 'package:mini/controller/dbfunctions.dart';
import 'package:mini/model/person.dart';
import 'package:mini/view/listscreen/listscreen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class edit_student extends StatefulWidget {
  var name;
  var age;
  var Class;
  var address;
  int index;

  edit_student({
    required this.index,
    required this.name,
    required this.age,
    required this.Class,
    required this.address,
  });

  @override
  State<edit_student> createState() => _edit_studentState();
}

class _edit_studentState extends State<edit_student> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _ageController = TextEditingController();

  TextEditingController _clsController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _clsController = TextEditingController(text: widget.Class);
    _addressController = TextEditingController(text: widget.address);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Age',
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _clsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Class',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Address',
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          updateall();
                        },
                        child: Text('Update')),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> updateall() async {
    final ih = _nameController.text.trim();
    final ih1 = _ageController.text.trim();
    final ih2 = _clsController.text.trim();
    final ih3 = _addressController.text.trim();

    if (ih.isEmpty || ih1.isEmpty || ih2.isEmpty || ih3.isEmpty) {
      return;
    } else {
      final updation = Person(name: ih, age: ih1, cls: ih2, address: ih3);

      //editstudent(widget.index, updation);
      Provider.of<DBProvider>(context, listen: false)
          .editstudent(widget.index, updation);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ListStudentWidget()));
    }
  }
}
