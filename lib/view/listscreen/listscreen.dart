import 'package:flutter/material.dart';
import 'package:mini/controller/dbfunctions.dart';
import 'package:mini/view/addscreen/addscreen.dart';
import 'package:mini/view/editscreen/editscreen.dart';
import 'package:provider/provider.dart';




class ListStudentWidget extends StatelessWidget {
  final namee;
  final agee;

  const ListStudentWidget({this.namee, this.agee});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 109, 177, 234),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddStudentWidget(),));
          
           
          },
          child: Icon(Icons.add),
        ),
        body: Consumer<DBProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = value.studentList.reversed.toList()[index];

                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.age.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        // deleteStudent(index);
                        Provider.of<DBProvider>(context, listen: false)
                            .deleteStudent(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => edit_student(
                            index: index,
                            name: data.name,
                            age: data.age,
                            Class: data.cls,
                            address: data.address,
                          ),
                        ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      )),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: value.studentList.length,
            );
          },
        ),
      ),
    );
  }
}
