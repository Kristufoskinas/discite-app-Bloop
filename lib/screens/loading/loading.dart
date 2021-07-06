import 'package:flutter/material.dart';
//import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*Map data = {};
  String inputText, outputText;*/

  /*void getOutput() async{

    /*Navigator.pushReplacementNamed(context, KonspektaiOutputScreen.routeName, arguments: {
      'outputText' : outputText,
    });*/
    //Navigator.pushNamed(context, KonspektaiOutputScreen.routeName);
  }*/
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => getOutput());
    //getOutput();
    //setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    /*data =ModalRoute.of(context).settings.arguments;
    inputText = data['inputText'];*/

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/fblogo.png'),
                  ),

                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery. of(context). size. height-210,
              //we subtract the width of the container and the margin (110+50) from the total screen size
              //then we also subtract 50 to give some margin for the SpinKitFadingCube (160+50 = 210)
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SpinKitFadingCube(

                      color: Colors.white,
                      size: 50.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}

