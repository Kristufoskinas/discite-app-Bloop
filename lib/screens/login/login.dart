import 'package:flutter/material.dart';
import '../../widgets/drawers/main_drawer.dart';
import '../../widgets/appbars/appbar.dart';
import '../../widgets/appbars/appbar_no_actions.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarNoActions(),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> accounts = {'Jasas':'1', 'Matelisx': '123', 'AsKietas':'123456', 'KietasAcc': 'slaptas123'};
  String username ='', password;
  String usernameValidator(value){
    username = value;
    if(value.isEmpty)return 'Please enter some text';
    else if(!accounts.containsKey(value)) return 'This username does not exist';
    else return null;
  }
  String passwordValidator(value){
    if(value.isEmpty) return 'Please enter some text';
    else if(accounts[username] != value) return 'Incorrect password';
    else return null;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              validator: usernameValidator,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: passwordValidator,
              obscureText: true,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      Navigator.pushNamed(context, '/konspektai');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

