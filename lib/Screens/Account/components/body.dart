import 'package:bloop/Screens/Home/components/body.dart';
import 'package:bloop/Screens/Home/home_screen.dart';
import 'package:bloop/Welcome/WelcomeScreen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body(
    Stack stack, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
        ),
        alignment: Alignment.center,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 79,
              ),
              FlatButton(
                child: Image.asset(
                  "assets/images/Account_button.png",
                  width: size.width * 0.9179,
                ),
                onPressed: null,
              ),
              SizedBox(
                height: 24,
              ),
              FlatButton(
                child: Image.asset(
                  "assets/images/Language_button.png",
                  width: size.width * 0.9179,
                ),
                onPressed: null,
              ),
              SizedBox(
                height: 24,
              ),
              FlatButton(
                child: Image.asset(
                  "assets/images/About_button.png",
                  width: size.width * 0.9179,
                ),
                onPressed: null,
              ),
              FlatButton(
                child: Image.asset(
                  "assets/images/Support_button.png",
                  width: size.width * 0.9179,
                ),
                onPressed: null,
              ),
              FlatButton(
                child: Image.asset(
                  "assets/images/Logout.png",
                  width: size.width * 0.9179,
                ),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, "Cancel"),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        ),
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
