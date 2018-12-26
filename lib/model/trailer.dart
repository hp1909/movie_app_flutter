class Trailer {
  final String id;
  final String trailerKey;
  final String name;
  final int size;
  final String type;

  Trailer({
    this.id,
    this.trailerKey,
    this.name,
    this.size,
    this.type,
  });

  Trailer.fromJSON(Map<String, dynamic> json)
    : id = json['id'],
      trailerKey = json['key'],
      name = json['name'],
      size = json['size'],
      type = json['type'];
}

class TrailerList {
  final List<Trailer> trailers;

  TrailerList({this.trailers});

  factory TrailerList.fromJSON(Map<String, dynamic> json) {
    var listFromJson = json['results'] as List;
    List<Trailer> trailers
      = listFromJson.map((item) => Trailer.fromJSON(item)).toList();
    return new TrailerList(trailers: trailers);
  }
}
