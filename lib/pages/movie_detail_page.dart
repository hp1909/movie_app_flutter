import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/widgets/movie_app_bar.dart';
import 'package:movie_app/widgets/movie_overview.dart';
import 'package:movie_app/widgets/movie_trailers.dart';
import 'package:movie_app/utils/constants.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage({this.movie, Key key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final tabs = [Tab(text: 'DETAILS'), Tab(text: 'REVIEWS')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              MovieAppBar(
                movieTitle: this.widget.movie.title,
              ),
              Container(
                height: 50,
                alignment: Alignment.bottomCenter,
                color: Colors.white,
                child: TabBar(
                  tabs: tabs,
                  labelColor: COLOR_BACKGROUND,
                  indicatorColor: COLOR_FOCUS,
                  indicatorWeight: 3,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: COLOR_LIGHT_PURPLE,
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              MovieOverview(movie: this.widget.movie),
                              Divider(height: 30),
                              MovieTrailers(movieId: this.widget.movie.id),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite),
      ),
    );
  }
}
