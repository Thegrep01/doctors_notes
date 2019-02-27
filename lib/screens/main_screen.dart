import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/screens/lists/active_list_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ActiveList(),
    Center(child: Text('Patients')),
    Center(child: Text('Archive'))
  ];

  void _handleTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(title: 'Doctor Notes'),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _handleTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text('Active'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Patients'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive), title: Text('Archive'))
        ],
      ),
    );
  }
}
