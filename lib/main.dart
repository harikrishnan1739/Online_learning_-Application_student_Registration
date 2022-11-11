
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/model/Student_model.dart';
import 'package:hive_project/spash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

//  final Directory document = await getApplicationDocumentsDirectory();
//  Hive.init(document.path);

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModalAdapter().typeId)) {
    Hive.registerAdapter(StudentModalAdapter());
  }
  await Hive.openBox<StudentModal>('Student_db');
  runApp(const MyApp());

  
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}