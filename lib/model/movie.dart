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

  Movie.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      voteAverage = map['vote_average'].toDouble(),
      title = map['title'],
      posterPath = map['poster_path'],
      overview = map['overview'],
      releaseDate = map['release_date'];

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['vote_average'] = voteAverage;
    map['title'] = title;
    map['poster_path'] = posterPath;
    map['overview'] = overview;
    map['release_date'] = releaseDate;

    return map;
  }
}