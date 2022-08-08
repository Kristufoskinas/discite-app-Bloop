import 'package:bloop/Screens/Account/account_screen.dart';
import 'package:bloop/Screens/Home/components/body.dart';
import 'package:bloop/Screens/New/new_screen.dart';
import 'package:bloop/Welcome/WelcomeScreen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final url2 = "http://api.dobloop.com/api/notes/";

  void getNotes() async {
    final response = await get(
      Uri.parse(url2),
      headers: {
        "Authorization": "Bearer $access_token",
      },
    );
    print(response.body);
    print("Nav bar home.dart");
  }

  void update() {
    setState(() {
      summary;
      date;
    });
  }

  int index = 1;
  final screens = [
    NewScreen(),
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
            TextStyle(
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
            //getNotes();
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
      //floatingActionButton: ,
    );
  }
}
