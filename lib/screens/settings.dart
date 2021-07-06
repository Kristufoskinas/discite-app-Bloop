import 'package:flutter/material.dart';
import 'package:project/widgets/summary_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/drawers/main_drawer.dart';
import 'package:project/widgets/bottom_nav.dart';
import 'package:project/widgets/appbars/appbar.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";
  static const _facebookUrl = 'https://www.facebook.com/jbdiscite';
  static const _instaUrl = 'https://www.instagram.com/jbdiscite/';
  Future<void> _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return (
    Scaffold(
        endDrawer: MainDrawer(),
        appBar: Appbar(),
        bottomNavigationBar: BottomNav(),
        body:
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              FullLineSummaryCard(
                "Main",
                Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Currently not available"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.vpn_key),
                          SizedBox(width: 15),
                          Text(
                            "Change password",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Currently not available"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: 15),
                          Text(
                            "Upgrade to premium",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
             /* Column(
                children: [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      leading:  Icon(Icons.vpn_key),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Currently not available"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      title: Text(
                        "Change password",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Icon(Icons.star),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Currently not available"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      title: Text(
                        "Upgrade to premium",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/

              ),
              FullLineSummaryCard(
                "Find Discite on",
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // dar neturim
                        //Image.asset("assets/find_us/twitter.jpg"),
                       // Image.asset("assets/find_us/linkedin.jpg"),
                        IconButton(
                          icon: Image.asset("assets/find_us/ig.jpg"),
                          onPressed: (){
                            _launchURL(_instaUrl);
                          },
                        ),
                        IconButton(
                          icon: Image.asset("assets/find_us/fb.jpg"),
                          onPressed: (){
                            _launchURL(_facebookUrl);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    ));
  }

}