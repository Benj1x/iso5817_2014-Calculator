import 'package:flutter/material.dart';
import 'package:iso5817_2014/models/form_model.dart';
import 'package:provider/provider.dart';
import '../controllers/grading_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

   final TextEditingController _plateThickness = TextEditingController();
   final TextEditingController _weldThickness = TextEditingController();
   final TextEditingController _widthWeld = TextEditingController();
   bool isFilletWeld = true;
   bool levelB = true;
   bool levelC = false;
   bool levelD = false;
  void _submitForm(GradingController gradingController) {
    if (!isFilletWeld){
      _plateThickness.text = "0.0";
    }
    final formModel = FormModel(
      filletWeld: isFilletWeld, 
      t: double.parse(_plateThickness.text), 
      a: double.parse(_weldThickness.text), 
      b: double.parse(_widthWeld.text), 
      levelB: levelB,
      levelC: levelC,
      levelD: levelD
    );
    gradingController.calculateResults(formModel);
  }

  @override
  Widget build(BuildContext context) {
    final gradingController = Provider.of<GradingController>(context);
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
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
              RadioListTile(
              value: true,
              groupValue: isFilletWeld,
              title: const Text(
                "Fillet Weld",  
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
              onChanged: (value) 
              {
                setState(() {
                isFilletWeld = value!;

              });},
              tileColor: const Color(0x1f000000),
              activeColor: const Color(0xff3a57e8),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: true,
              selectedTileColor: const Color(0x42000000),
            ),
            RadioListTile(
              value: false,
              groupValue: isFilletWeld,
              title: const Text(
                "Butt Weld",  
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
              onChanged: (value) 
              {
                setState(() {
                isFilletWeld = value!;

              });},
              tileColor: const Color(0x1f000000),
              activeColor: const Color(0xff3a57e8),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: true,
              selectedTileColor: const Color(0x42000000),
            ),
            Visibility(visible: isFilletWeld, child: Row(
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
                        const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                        const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                        const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
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
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                    controller: _widthWeld,
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
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
              value: levelB,
              title: const Text(
                "B",  
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
              onChanged: (value) 
              {
                setState(() {
                levelB = value;
                if (value == true) {
                  levelC = !value;
                  levelD = !value;
                }

              });},
              tileColor: const Color(0x1f000000),
              activeColor: const Color(0xff3a57e8),
              activeTrackColor: const Color(0xff92c6ef),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              inactiveThumbColor: const Color(0xff9e9e9e),
              inactiveTrackColor: const Color(0xffe0e0e0),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: true,
              selectedTileColor: const Color(0x42000000),
            ),
            SwitchListTile(
              value: levelC,
              title: const Text(
                "C",
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
              onChanged: (value) 
              {
                setState(() {
                levelC = value;
                if (value == true) {
                  levelB = !value;
                  levelD = !value;
                }
              });},
              tileColor: const Color(0x1f000000),
              activeColor: const Color(0xff3a57e8),
              activeTrackColor: const Color(0xff62ed2b),
              controlAffinity: ListTileControlAffinity.trailing,
              dense: false,
              inactiveThumbColor: const Color(0xff9e9e9e),
              inactiveTrackColor: const Color(0xffe0e0e0),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: const Color(0x42000000),
            ),
            SwitchListTile(
              value: levelD,
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
              onChanged: (value) 
              {
                setState(() {
                levelD = value;
                if (value == true) {
                  levelC = !value;
                  levelB = !value;
                } 
              });},
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
              onPressed: (){ 
                _submitForm(gradingController);
                gradingController.navigateToGradingView(context);
              },
              color: const Color(0xffffffff),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: const EdgeInsets.all(16),
              textColor: const Color(0xff000000),
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
          ]
        )
    );
  }
}
