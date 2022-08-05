import 'package:bloop/const.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.9,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          color: color,
          onPressed: () {
            press();
          },
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'DMSans',
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
