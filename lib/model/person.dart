import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String cls;

  @HiveField(4)
  final String address;
 
  Person(
      {required this.name,
      required this.age,
      required this.cls,
      required this.address,
      this.id,
      
      });
}
