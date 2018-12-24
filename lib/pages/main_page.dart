import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/widgets/movies_grid_view.dart';
import 'package:movie_app/model/movie_list.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Movie> _popularMovies = [];
  int _popularPage = 1;
  String movieType = POPULAR;
  
  List<Movie> _mostRatedMovies = [];
  int _mostRatedPage = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    _fetchData(movieType, _popularPage).then((movieList) {
      setState(() {
        _popularMovies.addAll(movieList.movies);
      });
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
                controller: _tabController,
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
                controller: _tabController,
                children: [
                  MoviesGridView(
                    movies: this._popularMovies,
                  ),
                  MoviesGridView(
                    movies: this._mostRatedMovies,
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

  Future<MovieList> _fetchData(String type, int page) async {
    print('https://api.themoviedb.org/3/movie/'
        + type + '?api_key=f507d227105e763cdd2ddf231fdfee81&language=en-US&page='
        + page.toString());
    final response = await http.get('https://api.themoviedb.org/3/movie/'
          + type + '?api_key=f507d227105e763cdd2ddf231fdfee81&language=en-US&page='
          + page.toString());
    return MovieList.fromJSON(json.decode(response.body));
  }

  void _handleTabSelection() async {
    if (!_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          movieType = POPULAR;
          if (_popularMovies.length == 0) {
            MovieList fetchedMovies = await _fetchData(movieType, _popularPage);
            _popularMovies.addAll(fetchedMovies.movies);
          }
          break;
        case 1:
          movieType = MOST_RATED;
          if (_mostRatedMovies.length == 0) {
            MovieList fetchedMovies = await _fetchData(
                movieType, _mostRatedPage);
            setState(() {
              _mostRatedMovies.addAll(fetchedMovies.movies);
            });
          }
          break;
        default:
          movieType = '';
      }
    }
  }
}
