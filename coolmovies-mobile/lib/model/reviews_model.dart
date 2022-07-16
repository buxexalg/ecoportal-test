class MovieReviews {
  MovieReviews({
    required this.allMovieReviews,
  });

  final AllMovieReviews allMovieReviews;

  factory MovieReviews.fromJson(Map<String, dynamic> json) => MovieReviews(
        allMovieReviews: AllMovieReviews.fromJson(json["allMovieReviews"]),
      );

  Map<String, dynamic> toJson() => {
        "allMovieReviews": allMovieReviews.toJson(),
      };
}

class AllMovieReviews {
  AllMovieReviews({
    required this.nodes,
  });

  final List<Node> nodes;

  factory AllMovieReviews.fromJson(Map<String, dynamic> json) =>
      AllMovieReviews(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    required this.id,
    required this.rating,
    required this.title,
    required this.body,
    required this.userByUserReviewerId,
    required this.movieByMovieId,
  });

  final String id;
  final int rating;
  final String title;
  final String body;
  final UserByUserReviewerId userByUserReviewerId;
  final MovieByMovieId movieByMovieId;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        rating: json["rating"],
        title: json["title"],
        body: json["body"],
        userByUserReviewerId:
            UserByUserReviewerId.fromJson(json["userByUserReviewerId"]),
        movieByMovieId: MovieByMovieId.fromJson(json["movieByMovieId"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "title": title,
        "body": body,
        "userByUserReviewerId": userByUserReviewerId.toJson(),
        "movieByMovieId": movieByMovieId.toJson(),
      };
}

class MovieByMovieId {
  MovieByMovieId({
    required this.title,
    required this.id,
  });

  final String title;
  final String id;

  factory MovieByMovieId.fromJson(Map<String, dynamic> json) => MovieByMovieId(
        title: json["title"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
      };
}

class UserByUserReviewerId {
  UserByUserReviewerId({
    required this.name,
  });

  final String name;

  factory UserByUserReviewerId.fromJson(Map<String, dynamic> json) =>
      UserByUserReviewerId(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
