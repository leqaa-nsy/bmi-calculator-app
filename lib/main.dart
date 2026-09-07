import 'package:second_project/bmi_screen.dart';
import 'package:second_project/icecreamScreen.dart';
import 'package:second_project/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:second_project/stack.dart';
void  main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screen1(),
    );
  }
}
