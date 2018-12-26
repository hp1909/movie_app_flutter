import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/utils/constants.dart';

import 'package:movie_app/model/trailer.dart';

class MovieTrailers extends StatefulWidget {

  final int movieId;

  MovieTrailers({this.movieId});

  @override
  _MovieTrailersState createState() => _MovieTrailersState();
}

class _MovieTrailersState extends State<MovieTrailers> {

  List<Trailer> trailers = [];

  @override
  void initState() {
    super.initState();

    _getMovieTrailers(this.widget.movieId).then((trailerList) {
      setState(() {
        trailers = trailerList.trailers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trailers.length,
        itemBuilder:
          (BuildContext context, int index) => _renderListTile(context, index),
      ),
    );
  }

  Widget _renderListTile(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network('https://img.youtube.com/vi/${trailers[index].trailerKey}/hqdefault.jpg'),
              Icon(Icons.play_circle_outline, size: 50,color: Colors.white,)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              trailers[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<TrailerList> _getMovieTrailers(int movieId) async {
    final response = await http.get('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$API_KEY&language=en-US');
    return TrailerList.fromJSON(json.decode(response.body));
  }
}
