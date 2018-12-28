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

  Trailer.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      trailerKey = map['key'],
      name = map['name'],
      size = map['size'],
      type = map['type'];
}

class TrailerList {
  final List<Trailer> trailers;

  TrailerList({this.trailers});

  factory TrailerList.fromMap(Map<String, dynamic> map) {
    var listFromJson = map['results'] as List;
    List<Trailer> trailers
      = listFromJson.map((item) => Trailer.fromMap(item)).toList();
    return new TrailerList(trailers: trailers);
  }
}
