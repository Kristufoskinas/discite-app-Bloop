import 'package:flutter/material.dart';
import '../summary_output/summary_output.dart';
import '../summaries/summaries.dart';
import '../../widgets/drawers/main_drawer.dart';
import '../../widgets/appbars/appbar_blank.dart';

class SummaryOutputScreen extends StatefulWidget {
  static const routeName = '/konspektai_output';

  @override
  _SummaryOutputScreenState createState() => _SummaryOutputScreenState();
}

class _SummaryOutputScreenState extends State<SummaryOutputScreen> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  Map data = {};
  String finalTextOutput  = "";




  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    var _controller = TextEditingController(text: data['finalTextOutput']);
    return Scaffold(
      body: Scaffold(
        key: _drawerscaffoldkey,
        appBar: AppbarBlank(),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 75,
                  left: 12,
                  right: 12,
                ),
                child: TextField(
                  maxLines: null,
                  controller: _controller,
                  onChanged: (value){
                    finalTextOutput = value;
                    //print(finalTextOutput);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Išsaugoti'),
                  onPressed: (){
                    //issaugojama duomenu bazeje ir griztama i home
                    Navigator.pushNamed(context, SummariesScreen.routeName);
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
