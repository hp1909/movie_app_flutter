import 'movie.dart';

class MovieList {
  final int pageNumber;
  final List<Movie> movies;

  MovieList({this.pageNumber, this.movies});

  factory MovieList.fromMap(Map<String, dynamic> map) {
    final List rawMovies = map['results'];
    final List<Movie> movies = rawMovies.map((item) => Movie.fromMap(item)).toList();

    return MovieList(
      pageNumber: map['page'],
      movies: movies,
    );
  }

  Map<String, dynamic> toMap() => {
    'page' : pageNumber,
    'results': movies,
  };
}