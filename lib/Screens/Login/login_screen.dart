import 'dart:convert';

import 'package:bloop/Screens/Home/home_screen.dart';
import 'package:bloop/Screens/Loading/loading_screen.dart';
import 'package:bloop/Screens/Login/Background.dart';
import 'package:bloop/Screens/Signup/signup_screen.dart';
import 'package:bloop/Welcome/WelcomeScreen.dart';
import 'package:bloop/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final url2 = "http://api.dobloop.com/api/notes/";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void postData() async {
    print("Start");
    final response = await post(
      Uri.parse('https://api.dobloop.com/rest-auth/login/'),
      body: {
        "email": _email.text,
        "password": _password.text,
      },
    );
    print(response.body);
    print("here?");
    if (response.body.length <= 300) {
      setState(() {
        sign_up_error = "Incorect email or password";
      });
    } else {
      setState(() {
        access_token = ((response.body.split("'access': '")[1]).split("'}")[0]);
      });
      setState(() {
        access_token = access_token;
      });
      print(access_token);
      print("loginscreen.dart");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen()),
      );
    }
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Center(
          child: Form(
            key: _formkey,
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    children: <Widget>[
                      SizedBox(height: size.height * 0.07),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          child: Image.asset(
                            "assets/images/back.png",
                            width: 87,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                          ),
                          //padding: EdgeInsets.all(0.0),
                        ),
                      ),
                      SizedBox(height: size.height * 0.07),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: size.width * 0.37,
                          height: size.height * 0.062,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo_o.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: size.height * 0.005),
                      Text(
                        'Sign in to Bloop',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(33, 34, 33, 1),
                            fontFamily: 'DM Sans',
                            fontSize: 28,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                      Text(
                        'Get full access to your summaries.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(97, 101, 121, 1),
                            fontFamily: 'DM Sans',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        width: size.width * 0.9179,
                        height: size.height * 0.078,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter an email.";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return "Please enter a valid email adress.";
                            }
                            return null;
                          },
                          controller: _email,
                        ),
                      ),
                      // PASSWORD
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        width: size.width * 0.9179,
                        height: size.height * 0.078,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a password.";
                            }
                            if (value.length < 8) {
                              return "Password must be atleast 8 characters!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        width: size.width * 0.9,
                        height: size.height * 0.08,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              backgroundColor: kPrimaryColor,
                            ),
                            /*padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            color: kPrimaryColor,*/
                            // FlatButtuno buve nustatymai
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                postData();
                              } else {
                                setState(() {
                                  sign_up_error = "Error!";
                                });
                              }
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSans',
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          sign_up_error,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.red,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Color(0xFF757574),
                          textStyle: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF757574),
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            sign_up_error = "";
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text("Don’t have an account?"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
