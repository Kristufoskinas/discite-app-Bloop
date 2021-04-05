import 'package:flutter/material.dart';
import 'file:///C:/Users/maaat/Desktop/Darbai/Discite/project/lib/widgets/appbars/appbar.dart';
import '../../widgets/drawers/main_drawer.dart';
import '../summary_input/summary_input.dart';


class SummariesScreen extends StatelessWidget {
  static const routeName = '/konspektai';
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: Appbar(),
      body: Center(
        child: Column(

          children: [
            Container(
              height: 200,
              padding: EdgeInsets.only(top:100),
              child: Text(
                'Norėdami konspektuoti spauskite "+"',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SummaryInputScreen.routeName);
        },
        child: Icon(Icons.add),
      ),


    );
  }
}