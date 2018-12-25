import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/main_page.dart';
import 'package:movie_app/pages/movie_detail_page.dart';

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
        '/signup': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/detail': (context) => MovieDetailPage(),
      },
    );
  }
}
