import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:coolmovies/pages/movie_details/movie_detail_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    String? id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Positioned(top: 0, child: PosterDetailQueryComponent(id)),
                Container(),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Color(0xff0f1c26),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          transform:
                              Matrix4.translationValues(20.0, -50.0, 0.0),
                          child: MoviePosterQueryComponent(id),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 20,
                            ),
                            MovieDetailQueryComponent(id),
                            Container(
                              height: 5,
                            ),
                            Column(
                              children: [
                                TitleTextComponent("Reviews"),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  child: MovieDetailReviewQueryComponent(id),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: FloatingActionButton(
                      heroTag: "backButton",
                      child: Icon(
                        Icons.arrow_back,
                        size: 26,
                      ),
                      backgroundColor: Color(0xff0f1c26),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ))
      ]),
    );
  }
}
