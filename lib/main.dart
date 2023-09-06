import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/controller/addscreenprovider.dart';
import 'package:mini/controller/dbfunctions.dart';
import 'package:mini/view/listscreen/listscreen.dart';
import 'package:mini/model/person.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(PersonAdapter().typeId)) {
    Hive.registerAdapter(PersonAdapter());
  }
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=>AddScreenProvider()),
       ChangeNotifierProvider(create: (context)=>DBProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListStudentWidget(),
      ),
    );
  }
}
