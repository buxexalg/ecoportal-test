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
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    separatorBuilder: (context, _) => SizedBox(
                      width: 12,
                    ),
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'DetailScreen',
                              arguments: '');
                        },
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                MovieInfoComponent('Star Wars: A New Hope',
                                    '25-05-1977', 'George Lucas'),
                                PosterComponent(
                                    'https://images-na.ssl-images-amazon.com/images/I/81aA7hEEykL.jpg',
                                    0.3),
                              ]),
                        )),
                  ),
                ),
                TitleTextComponent('Top Rated Reviews'),
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => ReviewComponent(
                          index,
                          'Star Wars',
                          '5',
                          'Chrono',
                          'Great Movie',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    ),
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
