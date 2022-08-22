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
  int index = 1;
  final screens = [
    NewScreen(),
    HomeScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
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
                "assets/images/new_icon.png",
                width: 17,
              ),
              selectedIcon: Image.asset(
                "assets/images/new_icon_filled.png",
                width: 17,
              ),
              label: 'Blooper',
            ),
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
    );
  }
}
