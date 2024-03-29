import 'dart:convert';

import 'package:bloop/Screens/Edit/edit_screen.dart';
import 'package:bloop/Screens/New/new_screen.dart';
import 'package:bloop/const.dart';
import 'package:bloop/models/api_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = "https://api.dobloop.com/api/notes/";

  Future<List<ApiData>> getNotes() async {
    final response = await get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $access_token",
      },
    );
    return ((json.decode(response.body) as List)
        .map((e) => ApiData.fromJson(e))
        .toList());
  }

  void Delete() async {
    final response2 = await post(
      Uri.parse('https://127.0.0.1:8000/api/summarizations/1/'),
      headers: {
        "Authorization": "Bearer $access_token",
      },
      body: {
        "id": ID,
      },
    );
    print(response2.body);
    if (response2.statusCode != 200) {
      setState(() {
        var error = jsonEncode(response2.body);
        sign_up_error = error.toString();
      });
    }
  }

  @override
  void initState() {
    getNotes().then((value) {
      setState(() {
        notes = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: size.height *
                0.92, //kiek scrollint galima, reikia paklausti kaip del height
            child: Column(
              //alignment: A
              // lignment.topCenter,
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 57,
                ),
                const Text(
                  "Your documents",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DMSans',
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                SizedBox(
                  height: size.width * 0.515,
                  width: size.width * 0.515,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => NewScreen()));
                    },
                    child: Image.asset(
                      "assets/images/Blooper.png",
                    ),
                  ),
                ),
                notes.isNotEmpty
                    ? Expanded(
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: notes
                              .map((e) => Container(
                                    height: size.width * 0.448,
                                    width: size.width * 0.448,
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {
                                        bloop_title = e.userText;
                                        bloop_text = e.summarizedText;
                                        bloop_ID = e.id;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditScreen()),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Text(
                                            e.userText,
                                            style: const TextStyle(
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                            maxLines: 1,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            e.summarizedText,
                                            style: const TextStyle(
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                            maxLines: 4,
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                date,
                                                style: const TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                                maxLines: 1,
                                              ),
                                              const Spacer(),
                                              /*TextButton(
                                                      onPressed: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                WelcomeScreen()),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/trash_icon.png",
                                                        width:
                                                            size.width * 0.04,
                                                      ),
                                                    ),*/
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: IconButton(
                                                  icon: Image.asset(
                                                    'assets/images/trash_icon.png',
                                                    width: size.width * 1,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      ID = bloop_ID;
                                                    });
                                                    Delete();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
