import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_list.dart';
import 'package:movie_app/utils/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();

    _fetchData().then((movies) {
      debugPrint('$movies');
    });
  }

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
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  Container(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 3 / 4,
                      children: _buildGridTitle(10),
                    ),
                    padding: EdgeInsets.all(5),
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

  List<Widget> _buildGridTitle(numberOfTiles) {
    List<Container> _containers = List<Container>.generate(numberOfTiles,
      (int index) {
      return new Container(
        color: Colors.orangeAccent,
      );
    });
    return _containers;
  }

  Future<MovieList> _fetchData() async {
    final respone =
      await http.get('https://api.themoviedb.org/3/movie/popular?api_key=f507d227105e763cdd2ddf231fdfee81&language=en-US&page=1');
    return MovieList.fromJSON(json.decode(respone.body));
  }
}
