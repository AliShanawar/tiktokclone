// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tiktokclone/pages/add_video_page.dart';
import 'package:tiktokclone/pages/discover_page.dart';
import 'package:tiktokclone/pages/home_page.dart';
import 'package:tiktokclone/pages/inbox_page.dart';
import 'package:tiktokclone/pages/profile_page.dart';
import 'package:tiktokclone/widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;
  static const List<Widget> _pages = [
    Homepage(),
    DiscoverPgae(),
    AddVideopage(),
    InboxPage(),
    profilepage(),
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _pages[_selectedPageIndex]),
        bottomNavigationBar: CustomBottomNavigationBar(
            selectedPageIndex: _selectedPageIndex, onIconTap: _onIconTapped));
  }
}
