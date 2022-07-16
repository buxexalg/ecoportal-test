import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/model/reviews_model.dart';
import 'package:coolmovies/pages/all_movies/all_movies_model.dart';
import 'package:flutter/cupertino.dart';

class AllMoviesViewModel {
  AllMoviesModel _model = AllMoviesModel();

  Movies? get movies => _model.allMovies;
  MovieReviews? get allReviews => _model.allReviews;

  void getAllMovies(BuildContext context) {
    _model.getAllMovies(context);
  }

  void getAllReviews(BuildContext context) {
    _model.getAllReviews(context);
  }
}
