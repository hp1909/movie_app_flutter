import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key key, VoidCallback onPressed, String label})
      : this.onPressed = onPressed,
        this.label = label,
        super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Color.fromARGB(255, 53, 61, 72),
        textColor: Colors.white,
        child: Text(label),
        onPressed: this.onPressed,
      ),
      width: 160,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
