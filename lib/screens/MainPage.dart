///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'flutterViz_bottom_navigationBar_model.dart';

class MainPage extends StatelessWidget {
  List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems =
      [
    FlutterVizBottomNavigationBarModel(
        icon: Icons.description, label: "Calculator"),
    FlutterVizBottomNavigationBarModel(
        icon: Icons.settings, label: "Miscellaneous")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: BottomNavigationBar(
        items: flutterVizBottomNavigationBarItems
            .map((FlutterVizBottomNavigationBarModel item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
        backgroundColor: Color(0xffffffff),
        currentIndex: 0,
        elevation: 8,
        iconSize: 24,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
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
              Text(
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
              Text(
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
              Text(
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
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
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
              Text(
                "Text",
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
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
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
              Text(
                "Text",
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
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
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
          Divider(
            color: Color(0xffffffff),
            height: 16,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
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
            title: Text(
              "D",
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
            activeTrackColor: Color(0xff58e84c),
            controlAffinity: ListTileControlAffinity.trailing,
            dense: false,
            inactiveThumbColor: Color(0xff9e9e9e),
            inactiveTrackColor: Color(0xffe0e0e0),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            selected: false,
            selectedTileColor: Color(0x42000000),
          ),
          MaterialButton(
            onPressed: () {},
            color: Color(0xffffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Color(0xff808080), width: 1),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              "Calculate Acceptance level",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
            textColor: Color(0xff000000),
            height: 40,
            minWidth: 140,
          ),
        ],
      ),
    );
  }
}
