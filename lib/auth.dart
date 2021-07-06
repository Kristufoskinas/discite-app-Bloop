import 'package:flutter/material.dart';
import 'screens/summaries/summaries.dart';
import 'screens/loading/loading.dart';
import 'screens/login/login.dart';
class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<void> _login() async{
    await Future.delayed(Duration(seconds: 1));
    // jei testuot error'us
    //return Future.delayed(const Duration(seconds: 2), () => throw Exception('Logout failed: user ID is invalid'));
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _login(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return AlertDialog(
              title: Text("Error"),
              content: SingleChildScrollView(
                child: Text("An error occurred. Please log in again."),
              ),
              actions: [
                TextButton(onPressed: () => {
                  Navigator.of(context).pop(),
                  Navigator.pushNamed(context, Login.routeName)
                }, child: Text("OK")),
              ],
            );
          }
          return SummariesScreen();
        }
        else{
          return Loading();
        }
      },
    );
  }
}
