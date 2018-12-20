import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class AuthTextField extends StatefulWidget {

  final TextEditingController controller;
  final String placeHolderText;
  final bool obcureText;
  final FocusNode focusNode;

  const AuthTextField({
    Key key,
    this.controller,
    this.placeHolderText = "",
    this.obcureText = false,
    this.focusNode,
  }) : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();


}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: TextField(
        obscureText: this.widget.obcureText,
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: this.widget.placeHolderText,
          hintStyle: TextStyle(color: COLOR_TEXT_HINT),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: COLOR_FOCUS, width: 2),
          ),
        ),
        controller: this.widget.controller,
        focusNode: this.widget.focusNode,
      ),
    );
  }
}
