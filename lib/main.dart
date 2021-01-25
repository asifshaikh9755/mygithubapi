import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github App',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: HomePage(title:'Parse Json Data'),
    );
  }
}

