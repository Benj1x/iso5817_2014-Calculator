import 'package:flutter/material.dart';
import 'package:iso5817_2014/controllers/grading_controller.dart';
import 'package:iso5817_2014/util/gradingStruct.dart';
import 'package:provider/provider.dart';

class GradingView extends StatefulWidget {
  final Gradingstruct? grades;

  const GradingView({Key? key, required this.grades}) : super(key: key);

  @override
  _GradingViewState createState() => _GradingViewState();
}

class _GradingViewState extends State<GradingView> {
  @override
  Widget build(BuildContext context) {
    final gradingController = Provider.of<GradingController>(context);

    // Dynamically map fields from Gradingstruct into a list of items
    final items = {
      "Crack": widget.grades?.Crack,
      "Crater Crack": widget.grades?.CraterCrack,
      "Surface Pore": widget.grades?.SurfacePore,
      "End Crater Pipe": widget.grades?.EndCraterPipe,
      "Lack of Fusion": widget.grades?.LackOfFusion,
      "MLack of Fusion": widget.grades?.MLackOfFusion,
      "Incomplete R Penetration": widget.grades?.IncompleteRPen,
      "Inter-Ucut": widget.grades?.InterUcut,
      "Shrink Groove": widget.grades?.ShrinkGroove,
      "Excess Weld": widget.grades?.ExcessWeld,
      "Excess Convexity": widget.grades?.ExcessConvex,
      "Excess Penetration": widget.grades?.ExcessPen,
      "Incorrect Weld Toe": widget.grades?.IncorrectWToe,
      "Overlap": widget.grades?.Overlap,
      "Non-Fusion Weld": widget.grades?.NonFW,
      "Burn Through": widget.grades?.BurnThrough,
      "Excess Asymmetric Fusion Weld": widget.grades?.ExcessAsymmFW,
      "Root Concavity": widget.grades?.RootConcav,
      "Root Porosity": widget.grades?.RootPoro,
      "Poor Start": widget.grades?.PoorStart,
      "Insufficient Throat Thickness": widget.grades?.InsuffTT,
      "Excess Throat Thickness": widget.grades?.ExcessTT,
      "Stray Arc": widget.grades?.StrayArc,
      "Spatter": widget.grades?.Spatter,
      "Temper Colour": widget.grades?.TemperColour,
      "Linear Misalignment": widget.grades?.LinearMis,
      "Incorrect Root Gap or Fusion Weld": widget.grades?.IncorrRootGapOrFW,
    }.entries
        .where((entry) => entry.value != null && entry.value!.isNotEmpty)
        .map((entry) => {"title": entry.key, "content": entry.value!})
        .toList();

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
          "Grading View",
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CollapsibleWidget(
            title: item["title"]!,
            content: item["content"]!,
          );
        },
      ),
    );
  }
}
class CollapsibleWidget extends StatefulWidget {
  final String title;
  final String content;

  const CollapsibleWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _CollapsibleWidgetState createState() => _CollapsibleWidgetState();
}

class _CollapsibleWidgetState extends State<CollapsibleWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(widget.title),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? null : 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        const SizedBox(height: 16), // Space between collapsible widgets
      ],
    );
  }
}