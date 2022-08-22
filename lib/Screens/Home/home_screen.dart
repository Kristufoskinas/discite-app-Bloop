import 'dart:convert';

import 'package:bloop/Screens/Account/account_screen.dart';
import 'package:bloop/Screens/Home/components/body.dart';
import 'package:bloop/Screens/New/new_screen.dart';
import 'package:bloop/Welcome/WelcomeScreen.dart';
import 'package:bloop/const.dart';
import 'package:bloop/models/api_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final url = "https://api.dobloop.com/api/notes/";

  void getNotes() async {
    final response = await get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $access_token",
      },
    );
    List<ApiData> data = <ApiData>[];
    data = ((json.decode(response.body) as List)
        .map((e) => ApiData.fromJson(e))
        .toList());

    print(data);
    print("Navbar");

    setState(() {
      notes = data;
    });
    print(notes);
  }

  // @override
  // void initState() {
  //   getNotes();
  //   super.initState();
  // }

  int index = 0;
  final screens = [
    HomeScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 12,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w400),
          ),
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          height: 100,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
            summary = summary;
            date = date;
          }),
          destinations: [
            NavigationDestination(
                icon: Image.asset(
                  "assets/images/home_icon.png",
                  width: 20,
                ),
                selectedIcon: Image.asset(
                  "assets/images/home_icon_filled.png",
                  width: 20,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Image.asset(
                  "assets/images/account_icon.png",
                  width: 15,
                ),
                selectedIcon: Image.asset(
                  "assets/images/account_icon_filled.png",
                  width: 15,
                ),
                label: 'Account'),
          ],
        ),
      ),
      //floatingActionButton: ,
    );
  }
}
