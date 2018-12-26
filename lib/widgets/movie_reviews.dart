import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/model/trailer.dart';
import 'package:movie_app/utils/constants.dart';

class MovieReviews extends StatefulWidget {

  final int movieId;

  MovieReviews({this.movieId});

  @override
  _MovieReviewsState createState() => _MovieReviewsState();
}

class _MovieReviewsState extends State<MovieReviews> {
  TrailerList trailerList;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<TrailerList> _getTrailers(int movieId) async {
    final response =
      await http.get('https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$API_KEY&language=en-US&page=1');
    return TrailerList.fromJSON(json.decode(response.body));
  }
}
