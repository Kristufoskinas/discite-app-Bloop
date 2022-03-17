//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:project/screens/login/confirm.dart';
import 'package:project/screens/login/confirm_reset.dart';
import 'package:project/screens/login/entry.dart';
import 'package:project/screens/login/helpers/configure_amplify.dart';
//import 'package:project/screens/add/camera.dart';
import 'package:project/screens/settings.dart';
import 'package:project/screens/summaries/summary_data.dart';
import 'screens/summaries/summaries.dart';
import 'screens/loading/loading.dart';
import 'screens/summaries/new_summary_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final cameras = await availableCameras();
  //print(cameras.toString());
  //final firstCamera = cameras.first;
  //runApp(Discite(firstCamera));
  await configureAmplify();

  runApp(Discite());
}

class Discite extends StatelessWidget {
  //final _camera;

  //Discite(this._camera);
  Discite();

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
        SummariesScreen.routeName: (_) => SummariesScreen(),
        Loading.routeName: (_) => Loading(),
        SummaryDataScreen.routeName: (_) => SummaryDataScreen(),
        //CameraScreen.routeName: (_) => CameraScreen(_camera),
        SettingsScreen.routeName: (_) => SettingsScreen(),
        NewSummaryDataScreen.routeName: (_) => NewSummaryDataScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/confirm') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                ConfirmScreen(data: settings.arguments as LoginData),
            transitionsBuilder: (_, __, ___, child) => child,
          );
        }

        if (settings.name == '/confirm-reset') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                ConfirmResetScreen(data: settings.arguments as LoginData),
            transitionsBuilder: (_, __, ___, child) => child,
          );
        }

        if (settings.name == '/konspektai') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => SummariesScreen(),
            transitionsBuilder: (_, __, ___, child) => child,
          );
        }

        if (settings.name == '/new_summary_data') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => NewSummaryDataScreen(),
            transitionsBuilder: (_, __, ___, child) => child,
          );
        }

        if (settings.name == '/summary_data') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => SummaryDataScreen(),
            transitionsBuilder: (_, __, ___, child) => child,
          );
        }

        //return MaterialPageRoute(builder: (_) => EntryScreen());

        return MaterialPageRoute(
            builder: (_) =>
                SummariesScreen()); //change to EntryScreen() to test login and signup flow
      },
    );
  }
}
