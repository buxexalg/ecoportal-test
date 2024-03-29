import 'package:graphql_flutter/graphql_flutter.dart';

final getAllMoviesQuery = gql(r"""
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
                movieDirectorByMovieDirectorId {
                  name
                }
              }
            }
          }
        """);

final getAllMovieReviewsQuery = gql(r"""
          query getAllMovieReviews {
            allMovieReviews(orderBy: RATING_DESC) {
              nodes {
                id
                rating
                title
                body
            userByUserReviewerId {
              name
            }
            movieByMovieId {
              title
              id
            }
          }
        }
      }
    """);

final getMovieById = gql(r"""
query MyQuery($id: UUID!) {
  movieById(id: $id) {
    imgUrl
    releaseDate
    title
    movieDirectorByMovieDirectorId {
      name
    }
    movieReviewsByMovieId {
      nodes {
        body
        rating
        title
        userByUserReviewerId {
          name
        }
      }
    }
  }
}
""");
