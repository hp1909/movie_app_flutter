import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class MovieAppBar extends StatelessWidget {
  final String movieTitle;

  MovieAppBar({this.movieTitle = "", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      height: 80,
      color: COLOR_BACKGROUND,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 30,
            child: Image.asset('assets/logo.png'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              child: Text(
                this.movieTitle.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(icon: Image.asset('assets/chosen.png'), onPressed: () {})
        ],
      ),
    );
  }
}
