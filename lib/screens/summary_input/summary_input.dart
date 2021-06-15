import 'package:flutter/material.dart';
import '../loading/loading.dart';
import '../../widgets/drawers/main_drawer.dart';
import '../summary_output/summary_output.dart';
import '../../widgets/appbars/appbar_blank.dart';

// Requests
import '../../services/requests.dart';

class SummaryInputScreen extends StatefulWidget {
  static const routeName = '/summaries_input';

  @override
  _SummaryInputScreenState createState() => _SummaryInputScreenState();
}

class _SummaryInputScreenState extends State<SummaryInputScreen> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  static RequestsService reqs = RequestsService();

  String textInput  = "";

  String outputText;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      body: Scaffold(
        key: _drawerscaffoldkey,
        appBar: AppbarBlank(),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 75,
                  left: 12,
                  right: 12,
                ),
                child: TextField(
                  onChanged: (value){
                    textInput = value;
                    //print(textInput);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Konspektuoti'),
                  onPressed: () async{
                    //kontaktas su API ir pereinam i kita ekrana
                    //kol kas neturim is kur gaut response, todel grazinam default teksta
                    setState(() {
                      loading = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    // outputText = 'Gautas atsakas is serverio: ' + (await reqs.getText());
                    print("outputText: "+outputText);
                    setState(() {
                      loading = false;
                    });
                    Navigator.popAndPushNamed(context, SummaryOutputScreen.routeName, arguments: {
                      'finalTextOutput' : outputText,
                    });

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
