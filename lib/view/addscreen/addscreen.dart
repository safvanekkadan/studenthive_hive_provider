
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/addscreenprovider.dart';

class AddStudentWidget extends StatelessWidget {
  const AddStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<AddScreenProvider>(
            builder: (context, addconsumer, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: addconsumer.nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addconsumer.ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addconsumer.clsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Class',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addconsumer.addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Address',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Provider.of<AddScreenProvider>(context, listen: false)
                          .onbuttonclikedaddStudent(context);
                    
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Student'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
