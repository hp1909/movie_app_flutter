import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/model/review.dart';
import 'package:movie_app/utils/constants.dart';

class MovieReviewsPage extends StatefulWidget {

  final int movieId;

  MovieReviewsPage({this.movieId});

  @override
  _MovieReviewsPageState createState() => _MovieReviewsPageState();
}

class _MovieReviewsPageState extends State<MovieReviewsPage> with AutomaticKeepAliveClientMixin {
  List<Review> _reviews = [];
  int _page = 1;
  int _totalPage = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _getTrailers(this.widget.movieId, _page).then((reviewList) {
      setState(() {
        _reviews.addAll(reviewList.reviews);
        _totalPage = reviewList.totalPages;
        _isLoading = false;
      });
      print(_reviews.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ) : Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemCount: _reviews.length,
        itemBuilder: (BuildContext context, int index) => _renderListTile(context, index)
      ),
    );
  }

  Future<ReviewList> _getTrailers(int movieId, int page) async {
    final response =
      await http.get('https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$API_KEY&language=en-US&page=$page');
    return ReviewList.fromJSON(json.decode(response.body));
  }
  
  Widget _renderListTile(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(_reviews[index].author.toUpperCase(), style: TextStyle(
              color: COLOR_FOCUS,
              fontSize: 16,
              fontWeight: FontWeight.bold
            )),
          ),
          Text(_reviews[index].content),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
