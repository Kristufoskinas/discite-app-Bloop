import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:intl/intl.dart';
import 'package:project/models/summary_models.dart';
import 'package:project/screens/summaries/summaries.dart';
import 'package:project/services/requests.dart';
import 'package:project/services/storage.dart';
import 'package:project/widgets/appbars/appbar.dart';
import 'package:project/widgets/bottom_nav.dart';
import 'package:project/widgets/drawers/main_drawer.dart';
import 'package:flutter/services.dart';
import 'package:project/services/helpers.dart';

class SummaryDataScreen extends StatelessWidget {
  static const routeName = '/summary_data';
  final RequestsService rs = RequestsService();
  final StorageService ss = StorageService();
  GlobalKey textFieldKey = GlobalKey();
  final InputDecoration _defaultInputDecoration = InputDecoration(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  @override
  Widget build(BuildContext context) {
    print(ModalRoute
        .of(context)
        .settings
        .arguments);
    SummaryData _summaryData = ModalRoute
        .of(context)
        .settings
        .arguments;

    TextEditingController _titleCont = TextEditingController(text: _summaryData.title ?? "Enter title");
    TextEditingController _textCont = TextEditingController(text: _summaryData.content ?? "Enter text");

    final DateTime _now = DateTime.now();
    final DateFormat _formatter = DateFormat('LLL d, y');
    final String _dateString = _formatter.format(_now);
    final String _uuid = Helpers().generateUniqueId();
    SummaryData sumData = SummaryData(id: _uuid, title: _titleCont.text, author: "", date: _dateString, content: _textCont.text);

    // cia jeigu su bold, italic ir t.t. norim
    //QuillController _controller = QuillController.basic();

    _summarizeText() async {
      String summarizedText = await rs.summarizeText(_textCont.text);

      showDialog(context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Patvirtinti?"),
              content: SingleChildScrollView(
                child: Text(summarizedText),
              ),
              actions: [
                TextButton(onPressed: () => {
                _textCont.text = summarizedText,
                  Navigator.of(context).pop(),
                }, child: Text("Taip")),
                TextButton(onPressed: () =>
                {
                  Navigator.of(context).pop(),
                }, child: Text("Ne"))
              ],
            );
          });
    }
    _saveChanges() async{
      // TODO: parasyti funkcija, kad overwritint'u summary
      Navigator.pushNamed(context, SummariesScreen.routeName);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: MainDrawer(),
        appBar: Appbar(),
        body: Padding(
          padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    TextField(
                      controller: _titleCont,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42.0),
                      decoration: _defaultInputDecoration,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _dateString,
                        textAlign: TextAlign.start,
                        textScaleFactor: 1.2,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () =>
                    {
                      Clipboard.setData(ClipboardData(text: _textCont.text)),
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied to clipboard")))
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/summary/copy.png"),
                        SizedBox(
                          width: 8,
                        ), // Padding
                        Text(
                          "Copy all",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ), // Padding
                  InkWell(
                    onTap: _summarizeText,
                    child:
                    Row(children: [
                      Image.asset("assets/summary/edit.png"),
                      SizedBox(
                        width: 8,
                      ), // Padding
                      Text(
                        "Summary",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ), // Padding

                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: _saveChanges,
                    child:
                    Row(children: [
                      Image.asset("assets/summary/save.png"),
                      SizedBox(
                        width: 8,
                      ), // Padding
                      Text(
                        "Save changes",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ]),
                  ),
                ],
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  controller: _textCont,
                  decoration: _defaultInputDecoration,
                  expands: true,
                  maxLines: null,
                ),
              ),
              // cia jeigu su bold, italic ir t.t. norim
              /*QuillToolbar.basic(controller: _controller),
              Expanded(
                child: Container(
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // true for view only mode
                  ),
                ),
              )*/
            ],
          ),
        ),
    );
  }
}
