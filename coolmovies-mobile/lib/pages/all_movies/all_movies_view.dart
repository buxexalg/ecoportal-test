import 'package:coolmovies/model/movies_model.dart';
import 'package:coolmovies/model/reviews_model.dart';
import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:coolmovies/pages/all_movies/all_movies_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllMoviesView extends StatefulWidget {
  const AllMoviesView({Key? key}) : super(key: key);

  @override
  State<AllMoviesView> createState() => _AllMoviesViewState();
}

class _AllMoviesViewState extends State<AllMoviesView> {
  final viewModel = AllMoviesViewModel();
  final ValueNotifier<Movies?> _moviesData = ValueNotifier(null);
  final ValueNotifier<MovieReviews?> _reviewsData = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    viewModel.getAllMovies(context);
    viewModel.getAllReviews(context);
    _moviesData.value = viewModel.movies;
    _reviewsData.value = viewModel.allReviews;

    return Scaffold(
      backgroundColor: Color(0xff1d2226),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                TitleTextComponent('Movies'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: _moviesData.value != null
                        ? _moviesData.value!.allMovies.nodes.length
                        : 0,
                    separatorBuilder: (context, _) => SizedBox(
                      width: 12,
                    ),
                    itemBuilder: (context, index) => ValueListenableBuilder(
                        valueListenable: _moviesData,
                        builder:
                            (BuildContext context, Movies? data, Widget? _) {
                          return data != null
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'DetailScreen',
                                        arguments:
                                            data.allMovies.nodes[index].id);
                                  },
                                  child: Container(
                                      height: 150,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: <Widget>[
                                            MovieInfoComponent(
                                                data.allMovies.nodes[index]
                                                    .title,
                                                convertDate(data.allMovies
                                                    .nodes[index].releaseDate),
                                                data
                                                    .allMovies
                                                    .nodes[index]
                                                    .movieDirectorByMovieDirectorId
                                                    .name),
                                            PosterComponent(
                                                data.allMovies.nodes[index]
                                                    .imgUrl,
                                                0.3),
                                          ])))
                              : Container();
                        }),
                  ),
                ),
                TitleTextComponent('Top Rated Reviews'),
                Expanded(
                  child: Container(
                    child: ValueListenableBuilder(
                        valueListenable: _reviewsData,
                        builder: (BuildContext context, MovieReviews? data,
                            Widget? _) {
                          return data != null
                              ? ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _reviewsData.value != null
                                      ? _reviewsData
                                          .value!.allMovieReviews.nodes.length
                                      : 0,
                                  separatorBuilder: (context, _) => SizedBox(
                                        width: 12,
                                      ),
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'DetailScreen',
                                              arguments: data
                                                  .allMovieReviews
                                                  .nodes[index]
                                                  .movieByMovieId
                                                  .id);
                                        },
                                        child: ReviewComponent(
                                          index,
                                          data.allMovieReviews.nodes[index]
                                              .title,
                                          data.allMovieReviews.nodes[index]
                                              .rating,
                                          data.allMovieReviews.nodes[index]
                                              .userByUserReviewerId.name,
                                          data.allMovieReviews.nodes[index]
                                              .title,
                                          data.allMovieReviews.nodes[index]
                                              .body,
                                        ),
                                      ))
                              : Container();
                        }),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
