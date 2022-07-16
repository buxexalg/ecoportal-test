import 'package:coolmovies/api/graphql_client.dart';
import 'package:coolmovies/api/graphql_queries.dart';
import 'package:coolmovies/model/movie_detail_model.dart';
import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/model/reviews_model.dart';
import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:flutter/material.dart';

class MovieCardQueryComponent extends StatelessWidget {
  const MovieCardQueryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getAllMoviesQuery,
        contentBuilder: (data) {
          final parsedResult = Movies.fromJson(data);
          return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: parsedResult.allMovies.nodes.length,
              separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'DetailScreen',
                          arguments: parsedResult.allMovies.nodes[index].id);
                    },
                    child: Container(
                        height: 150,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              MovieInfoComponent(
                                  parsedResult.allMovies.nodes[index].title,
                                  convertDate(parsedResult
                                      .allMovies.nodes[index].releaseDate),
                                  parsedResult.allMovies.nodes[index]
                                      .movieDirectorByMovieDirectorId.name),
                              PosterComponent(
                                  parsedResult.allMovies.nodes[index].imgUrl,
                                  0.3),
                            ])));
              });
        });
  }
}

class MovieReviewCardQueryComponent extends StatelessWidget {
  const MovieReviewCardQueryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryWrapper<MovieDetail>(
        queryString: getAllMovieReviewsQuery,
        contentBuilder: (data) {
          final parsedResult = MovieReviews.fromJson(data);
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: parsedResult.allMovieReviews.nodes.length,
              separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'DetailScreen',
                        arguments: parsedResult
                            .allMovieReviews.nodes[index].movieByMovieId.id);
                  },
                  child: ReviewComponent(
                    index,
                    parsedResult.allMovieReviews.nodes[index].title,
                    parsedResult.allMovieReviews.nodes[index].rating,
                    parsedResult
                        .allMovieReviews.nodes[index].userByUserReviewerId.name,
                    parsedResult
                        .allMovieReviews.nodes[index].movieByMovieId.title,
                    parsedResult.allMovieReviews.nodes[index].body,
                  ),
                );
              });
        });
  }
}
