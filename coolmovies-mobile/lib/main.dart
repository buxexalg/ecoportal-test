import 'package:coolmovies/API/graphql_client.dart';
import 'package:coolmovies/pages/all_movies/all_movies_view.dart';
import 'package:coolmovies/pages/movie_details/movie_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final moviesApiClient = MoviesApiClient();

  runApp(GraphQLProvider(
    client: moviesApiClient.client,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPortal Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllMoviesView(),
      routes: {'DetailScreen': (context) => MovieDetailView()},
    );
  }
}
