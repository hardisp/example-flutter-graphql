import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class WidgetQuery extends StatelessWidget {
  const WidgetQuery({
    Key? key,
    required this.gqlQuery,
    required this.variables,
    required this.fnResult,
  }) : super(key: key);

  final String gqlQuery;
  final Map<String, dynamic> variables;
  final Function(
    Map<String, dynamic>? data, {
    Future<QueryResult?> Function()? refetch,
    Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
    bool isLoading,
  }) fnResult;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(gqlQuery), // this is the query string you just created
        variables: variables,
        pollInterval: const Duration(minutes: 15),
      ),
      // Just like in apollo refetch() could be used to manually trigger a refetch
      // while fetchMore() can be used for pagination purpose
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.only(top: 24)),
              Text('Loading...'),
            ],
          ));
        }

        // it can be either Map or List
        // Map githubAccount = result.data!['user'];
        // List repositories = result.data!['viewer']['repositories']['nodes'];

        return fnResult(
          result.data!,
          refetch: refetch,
          fetchMore: fetchMore,
          isLoading: result.isLoading,
        );
      },
    );
  }
}
