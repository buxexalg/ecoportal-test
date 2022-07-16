import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:coolmovies/pages/all_movies/all_movies_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllMoviesView extends StatefulWidget {
  const AllMoviesView({Key? key}) : super(key: key);

  @override
  State<AllMoviesView> createState() => _AllMoviesViewState();
}

class _AllMoviesViewState extends State<AllMoviesView> {
  @override
  Widget build(BuildContext context) {
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
                  child: MovieCardQueryComponent(),
                ),
                TitleTextComponent('Top Rated Reviews'),
                Expanded(
                  child: Container(
                    child: MovieReviewCardQueryComponent(),
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
