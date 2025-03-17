import 'package:flutter/material.dart';
import '/controllers/grading_controller.dart';
import '/util/gradingStruct.dart';
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
      "Crack": {
        "content": widget.grades?.Crack,
      },
      "Crater Crack":{
        "content": widget.grades?.CraterCrack,
        "image": "assets/images/CraterCrack.png"
      },
      "Surface Pore":{
        "content": widget.grades?.SurfacePore,
        "image": "assets/images/ExcessAsymmFW.png"
      },
      "End Crater Pipe": {
        "content": widget.grades?.EndCraterPipe,
        "image": "assets/images/EndCraterPipe.png"

      },
      "Lack of Fusion": {
        "content": widget.grades?.LackOfFusion,
      },
      "MLack of Fusion": {
        "content": widget.grades?.MLackOfFusion,
      },
      "Incomplete R Penetration": {
        "content": widget.grades?.IncompleteRPen,
        "image": "assets/images/IncompleteRPen.png"
      },
      "Inter-Ucut": {
        "content": widget.grades?.InterUcut,
        "image": "assets/images/InterUcut.png"
      },
      "Shrink Groove": {
        "content": widget.grades?.ShrinkGroove,
        "image": "assets/images/ShrinkGroove.png"
      },
      "Excess Weld": {
        "content": widget.grades?.ExcessWeld,
        "image": "assets/images/ExcessWeld.png"
      },
      "Excess Convexity": {
        "content": widget.grades?.ExcessConvex,
        "image": "assets/images/ExcessConvex.png"
      },
      "Excess Penetration": {
        "content": widget.grades?.ExcessPen,
        "image": "assets/images/ExcessPen.png"
      },
      "Incorrect Weld Toe": {
        "content": widget.grades?.IncorrectWToe,
        "image": "assets/images/IncorrectWToe.png"
      },
      "Overlap": {
        "content": widget.grades?.Overlap,
        "image": "assets/images/Overlap.png"
      },
      "Non-Fusion Weld": {
        "content": widget.grades?.NonFW,
        "image": "assets/images/NonFW.png"
      },
      "Burn Through": {
        "content": widget.grades?.BurnThrough,
      },
      "Excess Asymmetric Fusion Weld": {
        "content": widget.grades?.ExcessAsymmFW,
        "image": "assets/images/ExcessAsymmFW.png"
      },
      "Root Concavity": {
        "content": widget.grades?.RootConcav,
        "image": "assets/images/RootConcav.png"
      },
      "Root Porosity": {
        "content": widget.grades?.RootPoro,
      },
      "Poor Start": {
        "content": widget.grades?.PoorStart,
      },
      "Insufficient Throat Thickness": {
        "content": widget.grades?.InsuffTT,
        "image": "assets/images/InsuffTT.png"
      },
      "Excess Throat Thickness": {
        "content": widget.grades?.ExcessTT,
        "image": "assets/images/ExcessTT.png"
      },
      "Stray Arc": {
        "content": widget.grades?.StrayArc,
      },
      "Spatter": {
        "content": widget.grades?.Spatter,
      },
      "Temper Colour": {
        "content": widget.grades?.TemperColour,
      },
      "Linear Misalignment": {
        "content": widget.grades?.LinearMis,
      },
      "Incorrect Root Gap or Fusion Weld": {
        "content": widget.grades?.IncorrRootGapOrFW,
        "image": "assets/images/IncorrRootGapOrFW.png"
      }
    }.entries
        .where((entry) =>
    entry.value["content"] != null &&
        entry.value["content"]!.isNotEmpty)
        .map((entry) => {
      "title": entry.key,
      "content": entry.value["content"]!,
      "image": entry.value["image"]
    })
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
        leading: IconButton(
          color: Color(0xff212435),
          iconSize: 24,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {  gradingController.navigateFromGradingView(context);},


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
            imagePath: item["image"], // Pass image path dynamically
          );
        },
      ),
    );
  }
}
class CollapsibleWidget extends StatefulWidget {
  final String title;
  final String content;
  final String? imagePath;

  const CollapsibleWidget({
    Key? key,
    required this.title,
    required this.content,
    this.imagePath,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.imagePath != null) // Check if image is provided
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      widget.imagePath!,
                      fit: BoxFit.cover,
                      height: 150, // Adjust as necessary
                    ),
                  ),
                Text(
                  widget.content,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), // Space between collapsible widgets
      ],
    );
  }
}