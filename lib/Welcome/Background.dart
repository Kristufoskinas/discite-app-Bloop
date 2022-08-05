import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xFFFCEEEA),
          height: size.height * 0.46919,
          width: size.width,
        ),
        Positioned(
          top: size.height * 0.087677,
          left: size.width * 0.1179,
          child: Container(
            width: size.width * 0.7641,
            height: size.height * 0.3531,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ws.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.526,
          left: size.width * 0.0615,
          child: Text(
            'Welcome to Bloop!',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(28, 30, 40, 1),
                fontFamily: 'DM Sans',
                fontSize: 28,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.bold,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
        ),
        Positioned(
          top: size.height * 0.526 + 40,
          left: size.width * 0.0615,
          child: Text(
            'Create an account to continue',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(97, 101, 121, 1),
                fontFamily: 'DM Sans',
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
        ),
        child,
      ],
    );
  }
}
