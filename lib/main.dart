import 'package:first_test/app.dart';
import 'package:first_test/secret.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  String serverGraphqlURL = 'https://api.github.com/graphql';

  final HttpLink httpLink = HttpLink(
    serverGraphqlURL,
  );
  final WebSocketLink websocketLink = WebSocketLink(
    'ws://api.github.com/subscriptions',
  );
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $kToken',
  );

  Link link = authLink.concat(httpLink);

  link = Link.split((request) => request.isSubscription, websocketLink, link);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
      // The default store is the InMemoryStore, which does NOT persist to disk
    ),
  );

  runApp(MyApp(graphqlClient: client));
}
