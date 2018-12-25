import 'package:flutter/material.dart';

import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/common.dart';

class MovieOverview extends StatefulWidget {
  final Movie movie;

  MovieOverview({this.movie, Key key}) : super(key: key);
  @override
  _MovieOverviewState createState() => _MovieOverviewState();
}

class _MovieOverviewState extends State<MovieOverview> {
  @override
  Widget build(BuildContext context) {
    final movie = this.widget.movie;
    final releaseDate = DateTime.parse(movie.releaseDate);

    print(releaseDate);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.network(POSTER_URL + movie.posterPath),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  children:renderVoteAverage(movie.voteAverage),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Image.asset('assets/date.png', height: 12, width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(formatDate('MMMM yyyy', releaseDate)),
                    ),
                  ],
                ),
                Divider(),
                Text(movie.overview),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  List<Widget> renderVoteAverage(double voteAverage) {
    return List<Widget>.generate(10, (int index) {
      if ((index + 1) <= voteAverage) {
        return Image.asset('assets/star1.png', height: 12, width: 12);
      } else {
        return Image.asset('assets/star.png', height: 12, width: 12);
      }
    });
  }
}
