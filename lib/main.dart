// lib/main.dart
import 'package:flutter/material.dart';
import 'package:iso5817_2014/controllers/grading_controller.dart';
import 'package:iso5817_2014/models/grading_model.dart';
import 'package:iso5817_2014/views/grading_view.dart';
import 'package:iso5817_2014/views/main_view.dart';
import 'package:iso5817_2014/views/miscellaneous.dart';
import 'package:iso5817_2014/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';
import 'controllers/misc_controller.dart';
import 'controllers/navbar_controller.dart';
import 'models/counter_model.dart';
import 'controllers/counter_controller.dart';
import 'models/misc_model.dart';
import 'views/counter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MainPage())
    );
  }
}
class MainPage extends StatelessWidget {
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
        children: [
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