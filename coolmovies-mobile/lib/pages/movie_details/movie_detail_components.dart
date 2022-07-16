import 'package:coolmovies/pages/all_movies/all_movies_components.dart';
import 'package:flutter/material.dart';

class PosterDetailComponent extends StatelessWidget {
  final String backdropPath;
  const PosterDetailComponent(this.backdropPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        backdropPath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MovieDetailInfoComponent extends StatelessWidget {
  final String movieTitle;
  final String movieDate;
  final String movieDirector;

  const MovieDetailInfoComponent(
      this.movieTitle, this.movieDate, this.movieDirector,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    child: Text(
                  movieTitle,
                  maxLines: 3,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
              ]),
              Container(
                height: 10,
              ),
              MovieInfoRow(Icons.calendar_today, movieDate),
              Container(
                height: 10,
              ),
              MovieInfoRow(Icons.account_circle_sharp, movieDirector),
            ],
          ),
        )
      ],
    );
  }
}

class MovieInfoRow extends StatelessWidget {
  final IconData iconText;
  final String runtime;

  const MovieInfoRow(this.iconText, this.runtime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        iconText,
        color: Colors.white,
        size: 20,
      ),
      Container(
        width: 3,
      ),
      Expanded(
          child: Text(
        runtime.toString(),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white, fontSize: 16),
      )),
    ]);
  }
}

class MovieDetailReviewComponent extends StatelessWidget {
  final int index;
  final String reviewTitle;
  final String reviewBody;
  final int reviewRating;
  final String reviewMovie;
  final String reviewUser;

  MovieDetailReviewComponent(this.index, this.reviewMovie, this.reviewRating,
      this.reviewUser, this.reviewTitle, this.reviewBody,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(left: 20, right: 20, top: 10)
          : const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Card(
          color: Color(0xff353E45),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                MovieReviewsRowComponent(
                    reviewUser,
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 20,
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    MovieReviewsRowComponent(
                        reviewRating.toString(),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        )),
                    SizedBox(width: 20),
                    MovieReviewsRowComponent(
                        reviewMovie,
                        Icon(
                          Icons.local_play_rounded,
                          color: Colors.white,
                          size: 20,
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      reviewTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  reviewBody,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
