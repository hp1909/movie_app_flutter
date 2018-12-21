import 'package:movie_app/utils/constants.dart';

class Movie {
  final int id;
  final double voteAverage;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;

  Movie({
    this.id,
    this.voteAverage,
    this.title,
    this.posterPath,
    this.overview,
    this.releaseDate
  });

  Movie.fromJSON(Map<String, dynamic> json)
    : id = json['id'],
      voteAverage = json['vote_average'].toDouble(),
      title = json['title'],
      posterPath = json['poster_path'],
      overview = json['overview'],
      releaseDate = json['release_date'];
}