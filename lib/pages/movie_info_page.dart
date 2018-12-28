import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_overview.dart';
import 'package:movie_app/widgets/movie_trailers.dart';

import 'package:movie_app/model/movie.dart';

class MovieInfoPage extends StatefulWidget {

  final Movie movie;

  MovieInfoPage({this.movie});

  @override
  _MovieInfoPageState createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
