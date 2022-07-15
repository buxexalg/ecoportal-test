import 'package:coolmovies/API/graphql_client.dart';
import 'package:coolmovies/API/graphql_queries.dart';
import 'package:coolmovies/model/movies_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AllMoviesModel {
  final moviesApiClient = MoviesApiClient();

  late Movies _allMovies;

  Movies get allMovies => _allMovies;

  void getAllMovies(BuildContext context) async {
    final QueryResult result =
        await moviesApiClient.query(context, getAllMoviesQuery);


    if (result.data != null) {
      final parsedJson =
          Movies.fromJson(result.data as Map<String, dynamic>);

      _allMovies = parsedJson;
    }
  }
}
