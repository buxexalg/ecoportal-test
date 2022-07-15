import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:coolmovies/pages/all_movies/all_movies_viewmodel.dart';
import 'package:coolmovies/pages/movie_details/movie_detail_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  final viewModel = AllMoviesViewModel();

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
                Positioned(
                    top: 0,
                    child: PosterDetailComponent(
                        'https://images-na.ssl-images-amazon.com/images/I/81aA7hEEykL.jpg')),
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
                      children: <Widget>[
                        Container(
                          transform:
                              Matrix4.translationValues(20.0, -50.0, 0.0),
                          child: PosterComponent(
                              'https://images-na.ssl-images-amazon.com/images/I/81aA7hEEykL.jpg',
                              0.40),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 20,
                            ),
                            MovieDetailInfoComponent('Star Wars: A New Hope',
                                '25-05-1977', 'George Lucas'),
                            Container(
                              height: 5,
                            ),
                            Column(
                              children: [
                                TitleTextComponent("Reviews"),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  child: ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 10,
                                    separatorBuilder: (context, _) => SizedBox(
                                      height: 12,
                                    ),
                                    itemBuilder: (context, index) =>
                                        MovieDetailReviewComponent(
                                            index,
                                            'Star Wars',
                                            '5',
                                            'Chrono',
                                            'Great Movie',
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                                  ),
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
