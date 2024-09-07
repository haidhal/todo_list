// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/utils/app_sessions.dart';
import 'package:todo_list/view/home_screen/home_screen.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 
  final box = await Hive.openBox(AppSessions.todoBox);
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}