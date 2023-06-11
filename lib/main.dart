import 'package:flutter/material.dart';
import 'package:new_intro_index/pages/home_page.dart';
import 'package:new_intro_index/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyIntroPage(),
      routes: {
        MyIntroPage.id:(context)=>const MyIntroPage(),
        HomePage.id:(context)=>const HomePage(),

      },
    );
  }
}


