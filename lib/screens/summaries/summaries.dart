import 'package:flutter/material.dart';
import 'package:project/models/summary_models.dart';
import 'package:project/screens/loading/loading.dart';
import 'package:project/services/storage.dart';
import 'package:project/widgets/bottom_nav.dart';
import 'package:project/widgets/appbars/appbar.dart';
import 'package:project/widgets/drawers/main_drawer.dart';
import 'package:project/widgets/summary_card.dart';
import '../add/camera.dart';

class SummariesScreen extends StatelessWidget {
  static const routeName = '/konspektai';
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

  List<Widget> _recentEntries;
  List<Widget> _allEntries;

  Future _loadEntries() async {
    // SummaryListData summaries = await StorageService().summaryListData;
    //
    // if (summaries != null) {
    //   if (summaries?.recentlyAccessed != null) {
    //     summaries?.recentlyAccessed?.forEach((summaryData) {
    //       _recentEntries.add(SummaryCard(summaryData));
    //     });
    //   } else {
    //     _recentEntries.add(
    //       Center(
    //         child: Text("No recents"),
    //       ),
    //     );
    //   }
    //   print(_recentEntries.toString());
    //
    //   if (summaries?.allEntries != null) {
    //     summaries?.allEntries?.forEach((summaryData) {
    //       _allEntries.add(SummaryCard(summaryData));
    //     });
    //   } else {
    //     _recentEntries.add(
    //       Center(
    //         child: Text("No entries. Create one by pressing the '+' button!"),
    //       ),
    //     );
    //   }
    //   print(_allEntries.toString());
    // }
    await Future.delayed(Duration(seconds: 1));
    _recentEntries = [
      SummaryCard( SummaryData(title: "Lietuvos ūkis tarpukariu", author: "Įvairūs šaltiniai", date: "random date", content: 'Po Pirmojo pasaulin...' )),
    ];

    _allEntries = [
      SummaryCard( SummaryData(title: "Jogaila: Žalgiriui 600", author: "Jadwiga krzyzaniakowa, Jerzy Ochmanski", date: "random date", content: "Teksto santrauka") ),
      SummaryCard( SummaryData(title: "A Jogaila: Žalgiriui 600", author: "Jadwiga krzyzaniakowa, Jerzy Ochmanski", date: "random date", content: "Teksto santrauka") ),
      SummaryCard( SummaryData(title: "B Jogaila: Žalgiriui 600", author: "Jadwiga krzyzaniakowa, Jerzy Ochmanski", date: "random date", content: "Teksto santrauka") ),
      SummaryCard( SummaryData(title: "C Jogaila: Žalgiriui 600", author: "Jadwiga krzyzaniakowa, Jerzy Ochmanski", date: "random date", content: "Teksto santrauka") ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    StorageService ss = StorageService();
    // bool noEntries = await ss.noEntries;

    return FutureBuilder(
        future: _loadEntries(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                endDrawer: MainDrawer(),
                appBar: Appbar(),
                bottomNavigationBar: BottomNav(),
                body: ListView(shrinkWrap: true, children: [
                  Column(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recent",
                        style: Theme.of(context).primaryTextTheme.headline4.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    // Container(
                    //   height: 200,
                    //   padding: EdgeInsets.only(top:100),
                    //   child: Text(
                    //     'Norėdami konspektuoti spauskite "+"',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),

                    ..._recentEntries,
                  ]),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "All documents",
                      style: Theme.of(context).primaryTextTheme.headline5.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Column(
                    children: _allEntries ?? [
                      Center(child:
                        Text("No entries. Create on by pressing the '+' button!", style: TextStyle(
                          fontSize: 15.0
                        ),),
                      ),
                    ],
                  ),
                ]));
          }
         // Navigator.pushNamed(context, CameraScreen.routeName);
          return Loading();
        }
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, SummaryInputScreen.routeName);
        //   },
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
