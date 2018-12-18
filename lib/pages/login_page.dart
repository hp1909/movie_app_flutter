import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth_button.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void goToSignInPage() {
    //TODO: Go to sign in page
  }

  void goToSignUpPage() {
    //TODO: Go to sign up page
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
              padding: EdgeInsets.all(100),
              child: Image.asset('assets/logo.png'),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AuthButton(
                      onPressed: goToSignInPage,
                      label: 'Sign in',
                    ),
                    AuthButton(
                      onPressed: goToSignUpPage,
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
                    disabledTextColor: Colors.white,
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
