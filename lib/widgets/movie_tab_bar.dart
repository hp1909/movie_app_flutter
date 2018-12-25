import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class MovieTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;

  MovieTabBar({this.tabs = const [], this.controller, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.bottomCenter,
        color: Colors.white,
        child: TabBar(
          controller: controller,
          tabs: tabs,
          labelColor: COLOR_BACKGROUND,
          indicatorColor: COLOR_FOCUS,
          indicatorWeight: 3,
        )
    );
  }
}
