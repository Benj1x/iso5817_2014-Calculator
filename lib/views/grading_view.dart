import 'package:flutter/material.dart';
import 'package:iso5817_2014/controllers/grading_controller.dart';
import 'package:iso5817_2014/util/gradingStruct.dart';
import 'package:provider/provider.dart';


class GradingView extends StatefulWidget {
  //const GradingView({super.key});

  //final GradingController controller;
  final Gradingstruct? grades;
  const GradingView({Key? key, required this.grades}) : super(key: key);

  @override
  _GradingViewState createState() => _GradingViewState();
}

class _GradingViewState extends State<GradingView> {
  @override
  Widget build(BuildContext context) {
    final gradingController = Provider.of<GradingController>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff3a57e8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: const Text(
            "AppBar",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
          ),
          leading: const Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
    );
  }
}
