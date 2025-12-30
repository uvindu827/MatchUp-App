import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex; // Add this
  final Function(int) onItemTapped; // Add this

  const BottomNav({
    super.key,
    required this.selectedIndex, // Add required
    required this.onItemTapped, // Add required
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex, // Use it here
      onTap: onItemTapped, // Use it here
      selectedItemColor: bottomNav_bar.selectedColor,
      unselectedItemColor: bottomNav_bar.unseletedColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: bottomNav_bar.name1,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_alt),
          label: bottomNav_bar.name2,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: bottomNav_bar.name3,
        ),
        // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
