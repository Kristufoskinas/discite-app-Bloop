import 'package:flutter/material.dart';
import 'screens/summary_output/summary_output.dart';
import 'screens/summaries/summaries.dart';
import 'screens/summary_input/summary_input.dart';
import 'screens/loading/loading.dart';
import 'screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(0, 0, 0, 1),
    100: Color.fromRGBO(0, 0, 0, 1),
    200: Color.fromRGBO(0, 0, 0, 1),
    300: Color.fromRGBO(0, 0, 0, 1),
    400: Color.fromRGBO(0, 0, 0, 1),
    500: Color.fromRGBO(0, 0, 0, 1),
    600: Color.fromRGBO(0, 0, 0, 1),
    700: Color.fromRGBO(0, 0, 0, 1),
    800: Color.fromRGBO(0, 0, 0, 1),
    900: Color.fromRGBO(0, 0, 0, 1),
  };
  MaterialColor primeColor = MaterialColor(0xFF000000, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Navigation bar tutorial',
      theme: ThemeData(
        primarySwatch: primeColor,
      ),
      routes: {
        '/': (_) => SummariesScreen(),
        SummariesScreen.routeName : (_) => SummariesScreen(),
        SummaryInputScreen.routeName :(_) => SummaryInputScreen(),
        SummaryOutputScreen.routeName : (_) => SummaryOutputScreen(),
        Loading.routeName : (_) => Loading(),
        Login.routeName : (_) => Login(),
      },
    );
  }
}

