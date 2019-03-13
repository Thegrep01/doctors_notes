import 'package:doctor_notes/common/header.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Center(child: Text('Active')),
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
              icon: Icon(Icons.explore),
              title: Text('Active'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Patients'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), title: Text('Archive'))
          ],
        ));
  }
}
