import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      initialRoute: '/',
      routes: {
        '/signin': (context) => SignInPage(),
      },
    );
  }
}
