import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MoviesApiClient {
  static HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  Future<QueryResult> query(BuildContext context, DocumentNode query) async {
    var client = GraphQLProvider.of(context).value;

    final QueryResult result = await client.query(QueryOptions(
      document: query,
    ));

    return result;
  }
}
