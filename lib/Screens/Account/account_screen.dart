import 'package:bloop/Screens/Account/components/body.dart';
import 'package:bloop/Screens/New/new_screen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(Stack(
        children: <Widget>[
          Positioned(
            bottom: 200,
            left: 0,
            child: SizedBox(
              width: size.width / 3,
              height: 100,
              child: RaisedButton(
                color: Colors.transparent,
                onPressed: () {
                  setState(() {
                    access_token = "";
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
