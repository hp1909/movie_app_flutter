import 'movie.dart';

class MovieList {
  final int pageNumber;
  final List<Movie> movies;

  MovieList({this.pageNumber, this.movies});

  factory MovieList.fromJSON(Map<String, dynamic> json) {
    final List rawMovies = json['results'];
    final List<Movie> movies = rawMovies.map((item) => Movie.fromJSON(item)).toList();

    return MovieList(
      pageNumber: json['page'],
      movies: movies,
    );
  }

  Map<String, dynamic> toJson() => {
    'page' : pageNumber,
    'results': movies,
  };
}