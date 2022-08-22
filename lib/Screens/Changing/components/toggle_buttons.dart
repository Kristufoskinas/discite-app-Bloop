import 'package:bloop/const.dart';
import 'package:flutter/material.dart';

class ToggleButtons1 extends StatefulWidget {
  @override
  _ToggleButtons1State createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) => Container(
        color: Color(0xFFFAFAFA),
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: kPrimaryColor,
          fillColor: kPrimaryLightColor,
          renderBorder: false,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  "English 🇬🇧",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              child: Text(
                "Lithuanian 🇱🇹",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                } else {
                  isSelected[index] = false;
                }
              }
            });
          },
        ),
      );
}
