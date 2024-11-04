import 'package:flutter/material.dart';
import 'package:iso5817_2014/models/form_model.dart';
import 'package:provider/provider.dart';
//import '../controllers/weld_controller.dart';
import '../controllers/grading_controller.dart';
import '../widgets/navbar_widget.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

   final TextEditingController _plateThickness = TextEditingController();
   final TextEditingController _weldThickness = TextEditingController();
   final TextEditingController _WidthWeld = TextEditingController();

  void _submitForm(GradingController gradingController) {
    final formModel = FormModel(
      weldType: "d", 
      t: _plateThickness.text, 
      a: _weldThickness.text, 
      b: _WidthWeld.text, 
      level: ""
    );
    gradingController.setData(formModel);
  }

  @override
  Widget build(BuildContext context) {
    final gradingController = Provider.of<GradingController>(context);
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(
              color: Color(0xffffffff),
              height: 16,
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Fillet weld",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Radio(
                  value: "Fillet",
                  groupValue: "",
                  onChanged: (value) {},
                  activeColor: Color(0xff43e83a),
                  autofocus: false,
                  splashRadius: 20,
                  hoverColor: Color(0x42000000),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Butt weld",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Radio(
                  value: "",
                  groupValue: "",
                  onChanged: (value) {},
                  activeColor: Color(0xff4ce83a),
                  autofocus: false,
                  splashRadius: 20,
                  hoverColor: Color(0x42000000),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Wall or plate thickness (nominal size) t [mm]:",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _plateThickness,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000)
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "Enter Text",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Nominal throat thickness of the fillet weld a [mm]:",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _weldThickness,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Width of weld reinforcement b [mm]:",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _WidthWeld,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color(0xffffffff),
              height: 16,
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Text(
                  "Level:",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            SwitchListTile(
              value: true,
              title: Text(
                "B",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              onChanged: (value) {},
              tileColor: Color(0x1f000000),
              activeColor: Color(0xff3a57e8),
              activeTrackColor: Color(0xff92c6ef),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              inactiveThumbColor: Color(0xff9e9e9e),
              inactiveTrackColor: Color(0xffe0e0e0),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
            ),
            SwitchListTile(
              value: true,
              title: Text(
                "C",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              onChanged: (value) {},
              tileColor: Color(0x1f000000),
              activeColor: Color(0xff3a57e8),
              activeTrackColor: Color(0xff62ed2b),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              inactiveThumbColor: Color(0xff9e9e9e),
              inactiveTrackColor: Color(0xffe0e0e0),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
            ),
            SwitchListTile(
              value: true,
              title: const Text(
                "D",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              onChanged: (value) {},
              tileColor: const Color(0x1f000000),
              activeColor: const Color(0xff3a57e8),
              activeTrackColor: const Color(0xff58e84c),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              inactiveThumbColor: const Color(0xff9e9e9e),
              inactiveTrackColor: const Color(0xffe0e0e0),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: const Color(0x42000000),
            ),
            MaterialButton(
              onPressed: () => _submitForm(gradingController),
              color: Color(0xffffffff),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
              child: const Text(
                "Calculate Acceptance level",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
