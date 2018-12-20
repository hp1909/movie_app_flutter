import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth_button.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  void _handleSignIn() {
    Navigator.pushNamed(context, '/signin');
  }

  void _handleSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  void _handleSkip() {
    Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Color.fromARGB(255, 36, 44, 57)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 80,
              child: Image.asset('assets/logo.png'),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AuthButton(
                      onPressed: _handleSignIn,
                      label: 'Sign in',
                    ),
                    AuthButton(
                      onPressed: _handleSignUp,
                      label: 'Sign up',
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Or Skip'),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          height: 10,
                          child: Image.asset('assets/skip.png'),
                        ),
                      ],
                    ),
                    textColor: Colors.white,
                    onPressed: _handleSkip,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
