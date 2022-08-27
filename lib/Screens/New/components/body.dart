import 'package:bloop/Screens/Changing/changing_screen.dart';
import 'package:bloop/Screens/New/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloop/const.dart';
import 'package:http/http.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final url = "http://api.dobloop.com/api/notes/";
  final TextEditingController _title = TextEditingController();
  final TextEditingController _note = TextEditingController();

  @override
  void initState() {
    _title.value = _title.value.copyWith(
      text: bloop_title,
    );
    _note.value = _note.value.copyWith(
      text: summary,
    );
  }

  /*@override
  void initState() {
    _title.value = _title.value.copyWith(
      text: bloop_title,
    );
    _note.value = _note.value.copyWith(
      text: summary,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  child: TextFormField(
                    controller: _title,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSans',
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DMSans',
                          color: Color(0xFFE5E5E5)),
                      hintText: 'Document Title',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (_title.toString().isEmpty) {
                        return "Please enter the document title.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  child: TextFormField(
                    controller: _note,
                    minLines: 1,
                    maxLines: 17,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DMSans',
                          color: Color(0xFFE5E5E5)),
                      hintText: 'Write text here...',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your text.";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /* Buves buttonas su nuotrauka, kurio size boxas neatitinka
                
                TextButton(
                  onPressed: () {
                    bloop_text = _note.text;
                    bloop_title = _title.text;
                    if (_note.text.length + _title.text.length < 1) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Error!"),
                                content: const Text(
                                    "There is nothing to be summarized, try putting in some text."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'))
                                ],
                              ));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChangingScreen()), //change to ChangingScreen
                      );
                    }
                  },
                  child: Image.asset(
                    "assets/images/Bloop_it.png",
                    width: size.width * 0.9179,
                  ),
                ), */

                ElevatedButton(
                    onPressed: () {
                      bloop_text = _note.text;
                      bloop_title = _title.text;
                      if (_note.text.length + _title.text.length < 1) {
                        showDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                                  title: const Text("Error!"),
                                  content: const Text(
                                      "There is nothing to be summarized, try putting in some text."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'))
                                  ],
                                ));
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangingScreen()), //change to ChangingScreen
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80))),
                    child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(255, 86, 64, 1),
                              Color.fromRGBO(255, 134, 74, 1),
                            ]),
                            borderRadius: BorderRadius.circular(80)),
                        child: Container(
                          width: 297,
                          height: 57,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 1.0, 15.0, 0.0),
                                child: SizedBox(
                                  child: Image.asset(
                                    'assets/images/o_logo.png',
                                    width: 30,
                                  ),
                                ),
                              ),
                              const Text(
                                'Bloop it',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'DMSans'),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
