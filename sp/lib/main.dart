import 'package:flutter/material.dart';
import 'package:sp/Google_Shared_Preference/google.dart';

// import 'mainPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeplayon Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: google(),
    );
  }
}
