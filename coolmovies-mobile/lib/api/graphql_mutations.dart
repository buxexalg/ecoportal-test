import 'package:graphql_flutter/graphql_flutter.dart';

final createUser = gql(r"""
mutation createUser($name: String!) {
  createUser(input: {user: {name: $name}}) {
    user {
      id
      name
    }
  }
}
""");

final createMovieReview = gql(r"""
mutation createMovieReview($body: String!, $movieId: UUID!, $rating: Int!, $title: String!, $userReviewerId: UUID!) {
  createMovieReview(
    input: {movieReview: {title: $title, movieId: $movieId, userReviewerId: $userReviewerId, body: $body, rating: $rating}}
  ) {
    movieReview {
      body
    }
  }
}
""");
