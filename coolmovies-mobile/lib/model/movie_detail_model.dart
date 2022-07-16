class MovieDetail {
  MovieDetail({
    required this.movieById,
  });

  final MovieById movieById;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        movieById: MovieById.fromJson(json["movieById"]),
      );

  Map<String, dynamic> toJson() => {
        "movieById": movieById.toJson(),
      };
}

class MovieById {
  MovieById({
    required this.imgUrl,
    required this.releaseDate,
    required this.title,
    required this.movieDirectorByMovieDirectorId,
    required this.movieReviewsByMovieId,
  });

  final String imgUrl;
  final DateTime releaseDate;
  final String title;
  final DirectorId movieDirectorByMovieDirectorId;
  final MovieReviewsByMovieId movieReviewsByMovieId;

  factory MovieById.fromJson(Map<String, dynamic> json) => MovieById(
        imgUrl: json["imgUrl"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        title: json["title"],
        movieDirectorByMovieDirectorId:
            DirectorId.fromJson(json["movieDirectorByMovieDirectorId"]),
        movieReviewsByMovieId:
            MovieReviewsByMovieId.fromJson(json["movieReviewsByMovieId"]),
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "movieDirectorByMovieDirectorId":
            movieDirectorByMovieDirectorId.toJson(),
        "movieReviewsByMovieId": movieReviewsByMovieId.toJson(),
      };
}

class DirectorId {
  DirectorId({
    required this.name,
  });

  final String name;

  factory DirectorId.fromJson(Map<String, dynamic> json) => DirectorId(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class MovieReviewsByMovieId {
  MovieReviewsByMovieId({
    required this.nodes,
  });

  final List<Node> nodes;

  factory MovieReviewsByMovieId.fromJson(Map<String, dynamic> json) =>
      MovieReviewsByMovieId(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    required this.body,
    required this.rating,
    required this.title,
    required this.userByUserReviewerId,
  });

  final String body;
  final int rating;
  final String title;
  final DirectorId userByUserReviewerId;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        body: json["body"],
        rating: json["rating"],
        title: json["title"],
        userByUserReviewerId: DirectorId.fromJson(json["userByUserReviewerId"]),
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "rating": rating,
        "title": title,
        "userByUserReviewerId": userByUserReviewerId.toJson(),
      };
}
