import 'package:coolmovies/api/graphql_client.dart';
import 'package:coolmovies/api/graphql_queries.dart';
import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/model/reviews_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AllMoviesModel {
  final moviesApiClient = MoviesApiClient();

  Movies? _allMovies;
  Movies? get allMovies => _allMovies;

  MovieReviews? _allReviews;
  MovieReviews? get allReviews => _allReviews;

  void getAllMovies(BuildContext context) async {
    final QueryResult result =
        await moviesApiClient.query(context, getAllMoviesQuery);

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      _allMovies = Movies.fromJson(result.data!);
    }
  }

  void getAllReviews(BuildContext context) async {
    final QueryResult result =
        await moviesApiClient.query(context, getAllMovieReviewsQuery);

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      _allReviews = MovieReviews.fromJson(result.data!);
    }
  }
}
