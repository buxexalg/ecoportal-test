import 'package:coolmovies/api/graphql_client.dart';
import 'package:coolmovies/api/graphql_queries.dart';
import 'package:coolmovies/model/movie_detail_model.dart';
import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:coolmovies/pages/movie_details/movie_detail_components.dart';
import 'package:flutter/material.dart';

class PosterDetailQueryComponent extends StatelessWidget {
  final String id;
  const PosterDetailQueryComponent(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getMovieById,
        variables: {'id': id},
        contentBuilder: (data) {
          final parsedResult = MovieDetail.fromJson(data);
          return PosterDetailComponent(parsedResult.movieById.imgUrl);
        });
  }
}

class MoviePosterQueryComponent extends StatelessWidget {
  final String id;
  const MoviePosterQueryComponent(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getMovieById,
        variables: {'id': id},
        contentBuilder: (data) {
          final parsedResult = MovieDetail.fromJson(data);
          return PosterComponent(parsedResult.movieById.imgUrl, 0.40);
        });
  }
}

class MovieDetailQueryComponent extends StatelessWidget {
  final String id;
  const MovieDetailQueryComponent(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getMovieById,
        variables: {'id': id},
        contentBuilder: (data) {
          final parsedResult = MovieDetail.fromJson(data);
          return MovieDetailInfoComponent(
              parsedResult.movieById.title,
              convertDate(parsedResult.movieById.releaseDate),
              parsedResult.movieById.movieDirectorByMovieDirectorId.name);
        });
  }
}

class MovieDetailReviewQueryComponent extends StatelessWidget {
  final String id;
  const MovieDetailReviewQueryComponent(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getMovieById,
        variables: {'id': id},
        contentBuilder: (data) {
          final parsedResult = MovieDetail.fromJson(data);
          return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount:
                  parsedResult.movieById.movieReviewsByMovieId.nodes.length,
              separatorBuilder: (context, _) => SizedBox(
                    height: 12,
                  ),
              itemBuilder: (context, index) => MovieDetailReviewComponent(
                    index,
                    parsedResult.movieById.title,
                    parsedResult
                        .movieById.movieReviewsByMovieId.nodes[index].rating,
                    parsedResult.movieById.movieReviewsByMovieId.nodes[index]
                        .userByUserReviewerId.name,
                    parsedResult
                        .movieById.movieReviewsByMovieId.nodes[index].title,
                    parsedResult
                        .movieById.movieReviewsByMovieId.nodes[index].body,
                  ));
        });
  }
}
