// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:need2give/screens/user/profile.dart';

import 'home_Page.dart';
import 'settings_Page.dart';
import 'search_page.dart';

class ButtonNavbar extends StatefulWidget {
  static const String routeName = '/Home';

  const ButtonNavbar({Key? key}) : super(key: key);

  @override
  _ButtonNavbarState createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const SearchPage(),
    profile(),
    SettingsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
