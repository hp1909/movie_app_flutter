import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth_button.dart';
import 'package:movie_app/utils/constants.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  void onCancel() {
    Navigator.pop(context);
  }

  void onSignIn() {}

  void onSignUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: COLOR_BACKGROUND),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.topRight,
              child: FlatButton(
                textColor: Colors.white,
                child: Text('Sign Up'),
                onPressed: onSignUp,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70, left: 45, right: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'EMAIL',
                        hintStyle: TextStyle(color: COLOR_TEXT_HINT),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: COLOR_FOCUS, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'PASSWORD',
                        hintStyle: TextStyle(color: COLOR_TEXT_HINT),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: COLOR_FOCUS, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        AuthButton(
                          label: 'Cancel',
                          onPressed: onCancel,
                        ),
                        AuthButton(
                          label: 'Sign In',
                          color: COLOR_FOCUS,
                          onPressed: onSignIn,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
