class Review {
  final String id;
  final String author;
  final String content;

  Review({this.id, this.author, this.content});

  Review.fromJSON(Map<String, dynamic> json)
    : id = json['id'],
      author = json['author'],
      content = json['content'];
}

class ReviewList {
  final int movieId;
  final int page;
  final int totalPages;
  final int totalResults;

  ReviewList({this.movieId, this.page, this.totalPages, this.totalResults});

  ReviewList.fromJSON(Map<String, dynamic> json)
    : movieId = json['id'],
      page = json['page'],
      totalPages = json['total_pages'],
      totalResults = json['total_results'];
}