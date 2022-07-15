import 'package:flutter/material.dart';

class MovieInfoComponent extends StatelessWidget {
  final String movieTitle;
  final String movieDate;
  final String movieDirector;

  MovieInfoComponent(this.movieTitle, this.movieDate, this.movieDirector,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(2.0, 1.0),
              )
            ],
            color: Color(0xff353E45),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(left: 120, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 10),
                MovieInfoRowComponent(
                    movieTitle,
                    Icon(
                      Icons.local_play_rounded,
                      color: Colors.white,
                      size: 20,
                    )),
                MovieInfoRowComponent(
                    movieDate,
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 20,
                    )),
                MovieInfoRowComponent(
                    movieDirector,
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 20,
                    )),
                Container(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieInfoRowComponent extends StatelessWidget {
  final String movieText;
  final Icon textIcon;

  MovieInfoRowComponent(this.movieText, this.textIcon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textIcon,
        Container(
          width: 10,
        ),
        Expanded(
          child: Text(
            movieText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class MovieReviewsRowComponent extends StatelessWidget {
  final String movieText;
  final Icon textIcon;

  MovieReviewsRowComponent(this.movieText, this.textIcon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textIcon,
        Container(
          width: 10,
        ),
        Container(
          child: Text(
            movieText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class PosterComponent extends StatelessWidget {
  final String posterUrl;
  final double widthRatio;

  PosterComponent(this.posterUrl, this.widthRatio, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 1.0,
            offset: new Offset(1, 0),
          ),
        ], borderRadius: BorderRadius.circular(10)),
        child: FractionallySizedBox(
          widthFactor: widthRatio,
          child: ClipRRect(
              child: Image.network(posterUrl),
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}

class ReviewComponent extends StatelessWidget {
  final int index;
  final String reviewTitle;
  final String reviewBody;
  final String reviewRating;
  final String reviewMovie;
  final String reviewUser;

  ReviewComponent(this.index, this.reviewMovie, this.reviewRating,
      this.reviewUser, this.reviewTitle, this.reviewBody,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(left: 10, top: 20, bottom: 20)
          : const EdgeInsets.symmetric(vertical: 20),
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
                        reviewRating,
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
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleTextComponent extends StatelessWidget {
  final String title;

  TitleTextComponent(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff353E45),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
      ),
    );
  }
}
