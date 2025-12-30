import 'package:flutter/material.dart';
import 'package:matchup/features/Score_page/presentation/page/score_page.dart';
import 'bottom_nav.dart';
import 'home_page.dart';
import '../features/Profile/presentation/page/profile_page.dart';
import '../features/Setting_page/presentation/page/setting_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProfilePage(),
    const HomePage(),
    const ScorePage(),
    const SettingPage(),
    // const Center(child: Text('Profile Page', style: TextStyle(fontSize: 32))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NoteHere')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
