import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/constants.dart';

class MoviesGridView extends StatefulWidget {
  final List<Movie> movies;
  MoviesGridView({this.movies, Key key}) : super(key: key);
  @override
  _MoviesGridViewState createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_LIGHT_PURPLE,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 5,
        children: _buildGridTitle(this.widget.movies),
      ),
      padding: EdgeInsets.all(5),
    );
  }

  List<Widget> _buildGridTitle(List<Movie> movies) {
    List<MovieTile> _containers = List<MovieTile>.generate(movies.length,
            (int index) {
          return new MovieTile(movie: movies[index]);
        });
    return _containers;
  }
}

class MovieTile extends StatefulWidget {
  final Movie movie;

  MovieTile({this.movie, Key key}) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movie = this.widget.movie;
    return Container(
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
                child: Text(movie.title.toUpperCase(), softWrap: false, style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white
              ),
              child: Icon(Icons.favorite, color: _isFavorite ? Colors.deepOrangeAccent : COLOR_LIGHT_PURPLE,),
            ),
          ),
        ],
      ),
    );
  }
}
0