import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/navbar_controller.dart';

class NavbarWidget extends StatelessWidget {
  final Function(int) onItemTapped;
  final PageController pageController;

  const NavbarWidget({super.key, required this.onItemTapped, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavbarController(pageController: pageController),
      child: Consumer<NavbarController>(
        builder: (context, NavbarController, child) {
          return BottomNavigationBar(
            currentIndex: NavbarController.selectedIndex,
            onTap: (index) {
              NavbarController.onItemTapped(index);
              onItemTapped(index); // Notify the parent widget
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.ad_units),
                label: 'Calculator',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Miscellaneous',
              ),
            ],
            elevation: 8,
            iconSize: 24,
            selectedItemColor: const Color(0xff3a57e8),
            unselectedItemColor: const Color(0xff9e9e9e),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            showSelectedLabels: true,
            showUnselectedLabels: true,

          );
        },
      ),

    );
  }
}
