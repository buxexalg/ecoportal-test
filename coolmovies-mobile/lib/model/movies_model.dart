class Movies {
  Movies({
    required this.allMovies,
  });

  final AllMovies allMovies;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        allMovies: AllMovies.fromJson(json["allMovies"]),
      );

  Map<String, dynamic> toJson() => {
        "allMovies": allMovies.toJson(),
      };
}

class AllMovies {
  AllMovies({
    required this.nodes,
  });

  final List<Node> nodes;

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    required this.id,
    required this.imgUrl,
    required this.movieDirectorId,
    required this.userCreatorId,
    required this.title,
    required this.releaseDate,
    required this.nodeId,
    required this.userByUserCreatorId,
    required this.movieDirectorByMovieDirectorId,
  });

  final String id;
  final String imgUrl;
  final String movieDirectorId;
  final String userCreatorId;
  final String title;
  final DateTime releaseDate;
  final String nodeId;
  final UserByUserCreatorId userByUserCreatorId;
  final MovieDirectorByMovieDirectorId movieDirectorByMovieDirectorId;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        imgUrl: json["imgUrl"],
        movieDirectorId: json["movieDirectorId"],
        userCreatorId: json["userCreatorId"],
        title: json["title"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        nodeId: json["nodeId"],
        userByUserCreatorId:
            UserByUserCreatorId.fromJson(json["userByUserCreatorId"]),
        movieDirectorByMovieDirectorId: MovieDirectorByMovieDirectorId.fromJson(
            json["movieDirectorByMovieDirectorId"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgUrl": imgUrl,
        "movieDirectorId": movieDirectorId,
        "userCreatorId": userCreatorId,
        "title": title,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "nodeId": nodeId,
        "userByUserCreatorId": userByUserCreatorId.toJson(),
        "movieDirectorByMovieDirectorId":
            movieDirectorByMovieDirectorId.toJson(),
      };
}

class MovieDirectorByMovieDirectorId {
  MovieDirectorByMovieDirectorId({
    required this.name,
  });

  final String name;

  factory MovieDirectorByMovieDirectorId.fromJson(Map<String, dynamic> json) =>
      MovieDirectorByMovieDirectorId(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class UserByUserCreatorId {
  UserByUserCreatorId({
    required this.id,
    required this.name,
    required this.nodeId,
  });

  final String id;
  final String name;
  final String nodeId;

  factory UserByUserCreatorId.fromJson(Map<String, dynamic> json) =>
      UserByUserCreatorId(
        id: json["id"],
        name: json["name"],
        nodeId: json["nodeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nodeId": nodeId,
      };
}

String convertDate(DateTime date) {
  return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()}";
}
