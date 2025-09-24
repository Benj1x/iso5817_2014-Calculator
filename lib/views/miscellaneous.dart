import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/misc_controller.dart';

class MiscView extends StatefulWidget {
  const MiscView({super.key});

  @override
  State<MiscView> createState() => _MiscViewState();
}

class _MiscViewState extends State<MiscView> {
  @override
  Widget build(BuildContext context) {
    final miscController = context.watch<MiscController>();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Terms and definitions:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Short imperfections: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "In cases when the weld is 100 mm long or longer, imperfections are considered to be short imperfections if, in the 100 mm which contains the greatest number of imperfections, their total length is not greater than 25 mm. In cases when the weld is less than 100 mm long, imperfections are considered to be short imperfections if their total length is not greater than 25 %.",
                style: TextStyle(fontSize: 12, color: Color(0xff000000)),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Symbols:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment(-0.8, 0.0),
                child: Text(
                  "a",
                  style: TextStyle(fontSize: 14, color: Color(0xff000000)),
                ),
              ),
              const Align(
                alignment: Alignment(-0.8, 0.0),
                child: Text(
                  "Nominal throat thickness of the fillet weld",
                  style: TextStyle(fontSize: 14, color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 4),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("Placeholder", style: TextStyle(fontSize: 14)),
              const Text("α", style: TextStyle(fontSize: 14)),
              const SizedBox(height: 16),

              // Calculate a -> z
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Calculate a to z:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text("a:", style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: miscController.aCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: _inputDecoration("Enter a"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: miscController.computeZFromA,
                    child: const Text("Compute z"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Calculate z -> a
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Calculate z to a:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text("z:", style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: miscController.zCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: _inputDecoration("Enter z"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: miscController.computeAFromZ,
                    child: const Text("Compute a"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(height: 25, thickness: 1, color: Color(0xffeeeeee)),
              const SizedBox(height: 8),
              const Text(
                "Idea and resources: Martin Christoffersen • LinkedIn • +45 53 60 62 19",
                style: TextStyle(fontSize: 14, color: Color(0xff000000)),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xfff2f2f3),
        isDense: false,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xff000000), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xff000000), width: 1),
        ),
      );
}
