import 'package:first_test/queries/user.dart';
import 'package:first_test/widgets/query.dart';
import 'package:first_test/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    icon: Icon(Icons.account_box_outlined),
    label: 'Profile',
  );

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    return WidgetQuery(
      gqlQuery: qReadUser,
      variables: const {'username': 'hardisp'},
      fnResult: (
        result, {
        Future<QueryResult?> Function()? refetch,
        Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
        bool isLoading = false,
      }) {
        Map githubAccount = result!['user'];
        return WidgetUser(
          avatarUrl: githubAccount['avatarUrl'],
          refetch: isLoading ? null : refetch,
          name: githubAccount['name'],
        );
      },
    );
  }
}
