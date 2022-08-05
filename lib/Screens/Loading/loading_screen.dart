import 'package:bloop/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void redirect() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    redirect();
    Size size = MediaQuery.of(context).size; // ekrano ismatavimai
    return Scaffold(
        body: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFFF5640), Color(0xFFFF864A)]),
      ),
      alignment: Alignment.center,
      child: Center(
          child: Image.asset(
        "assets/images/logo.png",
        //height: size.height * 0.077,
        width: size.width * 0.449,
      )),
    ));
  }
}
