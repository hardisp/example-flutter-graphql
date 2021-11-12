import 'package:first_test/screens/other.dart';
import 'package:first_test/screens/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: [const ScreenProfile(), const ScreenOther()][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          ScreenProfile.navItem,
          ScreenOther.navItem,
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _navigateTo,
      ),
    );
  }
}
