import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key key, VoidCallback onPressed, String label = '', Color color = COLOR_NORMAL})
      : this.onPressed = onPressed,
        this.label = label,
        this.color = color,
        super(key: key);

  final String label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: this.color,
        textColor: Colors.white,
        child: Text(label),
        onPressed: this.onPressed,
      ),
      width: 125,
      height: 45,
    );
  }
}
