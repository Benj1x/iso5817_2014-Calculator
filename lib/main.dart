// lib/main.dart
import 'package:flutter/material.dart';
import '/controllers/grading_controller.dart';
import '/views/main_view.dart';
import '/models/grading_model.dart';
import 'views/miscellaneous.dart';
import '/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';
import 'controllers/misc_controller.dart';
import 'controllers/navbar_controller.dart';
import 'models/misc_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GradingModel gradeModel = GradingModel();
    final MiscModel miscModel = MiscModel();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavbarController(pageController: PageController())),
          ChangeNotifierProvider(create: (_) => GradingController(gradeModel)),
          ChangeNotifierProvider(create: (_) => MiscController(miscModel)),
    ],
      child: MaterialApp(
      title: 'ISO 5817:2014 Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage())
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void _onNavbarItemTapped(int index, NavbarController navBarController) {
    navBarController.pageController.jumpToPage(index);
    navBarController.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    final navBarController = Provider.of<NavbarController>(context);

    return Scaffold(
      body: PageView(
        controller: navBarController.pageController,
        onPageChanged: (index) {
          navBarController.onItemTapped(index);
        },
        children: const [
          MainView(),
          MiscView()
        ],
      ),
      bottomNavigationBar: NavbarWidget(
        onItemTapped: (index) => _onNavbarItemTapped(index, navBarController),
        pageController: navBarController.pageController,
      ),
    );
  }
}