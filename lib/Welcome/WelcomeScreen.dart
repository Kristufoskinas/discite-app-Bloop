import 'package:bloop/Screens/Login/login_screen.dart';
import 'package:bloop/Screens/Signup/signup_screen.dart';
import 'package:bloop/Welcome/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, (size.height * 0.526 + 90), 0, 8),
                    width: size.width * 0.9,
                    height: size.height * 0.07,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFF6F45),
                        ),
                        //color: Color(0xFFFF6F45),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DM Sans',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.001),

              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.075),
                    width: size.width * 0.9,
                    height: size.height * 0.07,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFCEEEA),
                          ),
                          //color: Color(0xFFFCEEEA),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'I already have an account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 111, 69, 1),
                                fontFamily: 'DM Sans',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          )),
                    ),
                  ),
                ),
              ),
              // Figma Flutter Generator ByusingthisappyouagreetoourprivacypolicyandtermsconditionsWidget - TEXT
              Container(
                margin: EdgeInsets.fromLTRB(size.width * 0.0615, 0, 0, 0),
                child: Text(
                  'By using this app, you agree to our \nPrivacy Policy and Terms & Conditions',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(117, 117, 116, 1),
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
