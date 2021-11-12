import 'package:flutter/material.dart';

class ScreenOther extends StatefulWidget {
  const ScreenOther({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    icon: Icon(Icons.content_paste),
    label: 'Other',
  );

  @override
  _ScreenOtherState createState() => _ScreenOtherState();
}

class _ScreenOtherState extends State<ScreenOther> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Not Available'));
  }
}
