import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              height: 120,
              color: COLOR_BACKGROUND,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Image.asset('assets/logo.png'),
                  ),
                  IconButton(icon: Image.asset('assets/chosen.png'), onPressed: () {})
                ],
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              child: TabBar(
                labelColor: COLOR_BACKGROUND,
                indicatorColor: COLOR_FOCUS,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: 'POPULAR'),
                  Tab(text: 'MOST RATED'),
                  Tab(text: 'MY FAV'),
                ]),
            ),
            Container(
              height: 500,
              child: TabBarView(
                children: [
                  Container(
                    child: Text('hello'),
                  ),
                  Container(
                    child: Text('hello'),
                  ),
                  Container(
                    child: Text('hello'),
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
