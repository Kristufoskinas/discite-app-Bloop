import 'package:bloop/Welcome/WelcomeScreen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;
=======
>>>>>>> Stashed changes

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloop',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'DMSans'),
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
