import 'package:flutter/material.dart';
import 'package:project/widgets/summary_card.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return (
    Scaffold(body:
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              FullLineSummaryCard(
                "Main",
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.vpn_key),
                        Text("Change password")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text("Update to premium")
                      ],
                    ),
                  ],
                ),
              ),
              FullLineSummaryCard(
                "Find Discite on",
                Row(
                  children: [
                    Image.asset("assets/find_us/twitter.jpg"),
                    Image.asset("assets/find_us/linkedin.jpg"),
                    Image.asset("assets/find_us/ig.jpg"),
                    Image.asset("assets/find_us/fb.jpg"),
                  ],
                ),
              ),
            ],
          ),
        )
    ));
  }

}