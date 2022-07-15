import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/pages/all_movies/all_movies_model.dart';
import 'package:flutter/cupertino.dart';

class AllMoviesViewModel {
  AllMoviesModel _model = AllMoviesModel();

  Movies get movies => _model.allMovies;

  void getAllMovies(BuildContext context) {
    _model.getAllMovies(context);
  }
}
