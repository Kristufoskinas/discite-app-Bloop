import 'package:bloop/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 47,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavBar()),
              );
            },
            child: Image.asset(
              "assets/images/Back2.png",
              width: size.width * 0.2718,
            ),
          ),
          const Divider(
            color: Color(0xFFE1E1E1),
            //color: Colors.black,
            thickness: 2,
          ),
          child,
        ],
      ),
    );
  }
}
