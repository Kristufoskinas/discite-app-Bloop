import 'dart:convert';

import 'package:bloop/Screens/Home/components/body.dart';
import 'package:bloop/Screens/Home/home_screen.dart';
import 'package:bloop/Screens/New/new_screen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChangingScreen extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<ChangingScreen> {
  List<bool> isSelected = [true, false];
  double _currentSliderValue = 35;
  final url = "http://127.0.0.1:8000/api/notes/";

  void postData() async {
    final response = await post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $access_token",
      },
      body: {
        "user_text": bloop_text,
        "title": bloop_title,
        "percentage": _currentSliderValue.round().toString(),
        "language": bloop_language,
      },
    );
    print(response.body);
    if (response.body.length < 10) {
    } else {
      Bloop_response = response.body.toString();
      print(Bloop_response);
      summary = Bloop_response.split('"summarized_text":"')[1];
      setState(() {
        summary = summary.split('","created_date"')[0];
      });

      date = Bloop_response.split('"created_date":"')[1];
      setState(() {
        date = date.substring(0, 10);
      });
      if (summary.length < 1) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Error!"),
                  content: Text(
                      "There is nothing to be summarized, try putting in more text."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                ));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 47,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewScreen()),
                  );
                },
                child: Image.asset(
                  "assets/images/Back2.png",
                  width: size.width * 0.2718,
                ),
              ),
              Divider(
                color: Color(0xFFE1E1E1),
                thickness: 2,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Summarisation level",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DMSans',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                inactiveColor: Color(0xFFE1E1E1),
                activeColor: kPrimaryColor,
                value: _currentSliderValue,
                divisions: 100,
                min: 0,
                max: 100,
                autofocus: false,
                thumbColor: kPrimaryLightColor,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Document language",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DMSans',
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  color: Color(0xFFFAFAFA),
                  child: ToggleButtons(
                    isSelected: isSelected,
                    selectedColor: kPrimaryColor,
                    fillColor: kPrimaryLightColor,
                    renderBorder: false,
                    children: const <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          "English 🇬🇧",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                      setState(
                        () {
                          for (int index = 0;
                              index < isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              isSelected[index] = true;
                            } else {
                              isSelected[index] = false;
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                  flex: 15,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: /*FlatButton(
                      onPressed: () {
                        postData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Image.asset(
                        "assets/images/Bloop_it.png",
                        width: size.width * 0.7615,
                      ),
                    ),*/
                        ElevatedButton(
                            onPressed: () {
                              postData();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80))),
                            child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color.fromRGBO(255, 86, 64, 1),
                                      Color.fromRGBO(255, 134, 74, 1),
                                    ]),
                                    borderRadius: BorderRadius.circular(80)),
                                child: Container(
                                  width: 297,
                                  height: 57,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5.0, 1.0, 15.0, 0.0),
                                        child: SizedBox(
                                          child: Image.asset(
                                            'assets/images/o_logo.png',
                                            width: 30,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Bloop it',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'DMSans'),
                                      ),
                                      //Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            5.0, 1.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                  )),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
