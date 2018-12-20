import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth_button.dart';
import 'package:movie_app/widgets/auth_text_field.dart';
import 'package:movie_app/utils/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    this._emailFocusNode = FocusNode();
    this._passwordFocusNode = FocusNode();
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleSignIn() {
    FocusScope.of(context).requestFocus(_emailFocusNode);
    debugPrint(_emailController.text);
    debugPrint(_passwordController.text);
  }

  void onSignUp() {
    _emailFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          debugPrint('tap');
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
        },
        child: Container(
          decoration: new BoxDecoration(color: COLOR_BACKGROUND),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                alignment: Alignment.topRight,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text('Sign In'),
                  onPressed: onSignUp,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AuthTextField(
                            controller: _emailController,
                            placeHolderText: 'EMAIL',
                            focusNode: _emailFocusNode,
                          ),
                          AuthTextField(
                            controller: _passwordController,
                            placeHolderText: 'PASSWORD',
                            obcureText: true,
                            focusNode: _passwordFocusNode,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          AuthButton(
                            label: 'Cancel',
                            onPressed: _handleCancel,
                          ),
                          AuthButton(
                            label: 'Sign Up',
                            color: COLOR_FOCUS,
                            onPressed: _handleSignIn,
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
      ),
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }
}
