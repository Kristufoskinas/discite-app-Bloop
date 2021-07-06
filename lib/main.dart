import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/add/camera.dart';
import 'package:project/screens/settings.dart';
import 'package:project/screens/summary_data.dart';
import 'screens/summaries/summaries.dart';
import 'screens/loading/loading.dart';
import 'screens/login/login.dart';
import 'screens/new_summary_data.dart';
import 'auth.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  print(cameras.toString());
  final firstCamera = cameras.first;

  runApp(Discite(firstCamera));
}

class Discite extends StatelessWidget {

  final _camera;

  Discite(this._camera);

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primeColor,

      ),
      routes: {
        '/': (_) => AuthScreen(),
        SummariesScreen.routeName : (_) => SummariesScreen(),
        Loading.routeName : (_) => Loading(),
        Login.routeName : (_) => Login(),
        SummaryDataScreen.routeName : (_) => SummaryDataScreen(),
        CameraScreen.routeName: (_) => CameraScreen(_camera),
        SettingsScreen.routeName: (_) => SettingsScreen(),
        NewSummaryDataScreen.routeName: (_) => NewSummaryDataScreen(),
        AuthScreen.routeName: (_) => AuthScreen(),
      },
    );
  }
}

