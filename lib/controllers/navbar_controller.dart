import 'package:flutter/material.dart';

class NavbarController with ChangeNotifier {
  final PageController pageController;

  NavbarController({required this.pageController});

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}