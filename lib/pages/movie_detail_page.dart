import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/widgets/movie_app_bar.dart';
import 'package:movie_app/pages/movie_info_page.dart';
import 'package:movie_app/pages/movie_reviews_page.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/services/database_helper.dart';


class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage({this.movie, Key key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final tabs = [Tab(text: 'DETAILS'), Tab(text: 'REVIEWS')];
  DatabaseHelper _db = new DatabaseHelper();
  bool _isFavoriteMovie = false;

  @override
  void initState() {
    super.initState();
    _db.isFavoriteMovie(this.widget.movie.id).then((isFavoriteMovie) {
      setState(() {
        _isFavoriteMovie = isFavoriteMovie;
      });
    });
  }

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
                      MovieInfoPage(movie: this.widget.movie),
                      MovieReviewsPage(movieId: this.widget.movie.id),
                    ],
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: handleFavoriteButtonPress,
        child: Icon(Icons.favorite, color: _isFavoriteMovie ? Colors.deepOrangeAccent :  Colors.grey),
        backgroundColor: Colors.white,
      ),
    );
  }

  void handleFavoriteButtonPress() async {
    if (_isFavoriteMovie) {
      await _db.removeFavoriteMovie(this.widget.movie.id);
    } else {
      await _db.addFavoriteMovie(this.widget.movie);
    }
    setState(() {
      _isFavoriteMovie = !_isFavoriteMovie;
    });
  }
}
