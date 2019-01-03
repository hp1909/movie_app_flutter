import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/movie_detail_page.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/services/database_helper.dart';

class MoviesGridView extends StatefulWidget {
  final List<Movie> movies;
  final bool isLoading;
  final bool isFavoritePage;

  MoviesGridView({this.movies, this.isLoading = false, this.isFavoritePage = false, Key key}) : super(key: key);
  @override
  _MoviesGridViewState createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> with AutomaticKeepAliveClientMixin {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    
    _controller.addListener(_scrollListener);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return this.widget.isLoading ?
      Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
    : Container(
      color: COLOR_LIGHT_PURPLE,
      child: GridView.count(
        controller: _controller,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 5,
        children: _buildGridTitle(this.widget.movies, this.widget.isFavoritePage),
      ),
      padding: EdgeInsets.all(5),
    );
  }

  List<Widget> _buildGridTitle(List<Movie> movies, bool isFavoritePage) {
    List<MovieTile> _containers = List<MovieTile>.generate(movies.length,
            (int index) {
          return new MovieTile(movie: movies[index], isFavoritePage: isFavoritePage);
        });
    return _containers;
  }

  void _scrollListener() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {

    }
  }

  Widget _loader(bool isLoading) {
    return isLoading ? Container(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    ) : SizedBox(width: 0, height: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class MovieTile extends StatefulWidget {
  final Movie movie;
  final bool isFavoritePage;

  MovieTile({this.movie, this.isFavoritePage = false, Key key}) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {

  bool _isFavorite = false;

  DatabaseHelper _db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    _db.isFavoriteMovie(this.widget.movie.id).then((isFavoriteMovie) {
      setState(() {
        _isFavorite = isFavoriteMovie;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final movie = this.widget.movie;
    return GestureDetector(
      onTap: () {
        print('tap');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(
              movie: movie,
            )
          ),
        );
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    POSTER_URL + movie.posterPath,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    movie.title.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            this.widget.isFavoritePage ? null :
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                if (_isFavorite) {
                  _db.addFavoriteMovie(movie).then((result) => print(result));
                } else {
                  _db.removeFavoriteMovie(movie.id).then((result) => print(result));
                }
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white
                ),
                child: Icon(
                  Icons.favorite,
                  color: _isFavorite ? Colors.deepOrangeAccent : COLOR_LIGHT_PURPLE,
                ),
              ),
            ),
          ].where((item) => item != null).toList(),
        ),
      ),
    );
  }
}