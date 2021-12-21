import 'package:flutter/material.dart';
import 'package:india_today_assignment/utils/constants.dart';

import 'astrologers_screen.dart';
import 'panchang_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> screens = const [PanchangScreen(), AstrologersScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded), label: 'Daily Panchang'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(TALK_ICON)),
                label: 'Talk to Astrologer'),
          ]),
      body: screens[_currentIndex],
    );
  }
}
