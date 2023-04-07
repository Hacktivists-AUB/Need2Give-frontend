import 'package:flutter/material.dart';
import 'package:need2give/screens/main_pages_navbar/home_page.dart';
import 'package:need2give/screens/main_pages_navbar/settings_page.dart';
import 'package:need2give/screens/user/explore.dart';
import 'package:need2give/screens/user/profile.dart';

class ButtonNavbar extends StatefulWidget {
  static const String routeName = '/main';

  const ButtonNavbar({super.key});

  @override
  State<ButtonNavbar> createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const Explore(),
    const Profile(),
    const SettingsPage(),
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