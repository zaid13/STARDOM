import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stardom/pages/celeb/auth/celebLogin.dart';
import 'package:stardom/pages/user/home/userHomePage/user_home.dart';

import '../../../models/UserModel.dart';
import '../../../providers/AuthProvider.dart';
import 'package:provider/provider.dart';


class userLogin extends StatefulWidget {
  @override
  _userLoginState createState() => _userLoginState();
}

class _userLoginState extends State<userLogin> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color.fromRGBO(137, 12, 235, 1),
                  const Color.fromRGBO(43, 12, 235, 0.85),
                ])),
            height: height,
            child: Container(
              height: height,
              margin: EdgeInsets.all(width * 0.1),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width,
                            child: Text(
                              "Stardom.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 70,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: width,
                            child: Text(
                              "Celebrities are just a message away.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(5)),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return celebLogin();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              width: width,
                              child: Text(
                                "Are you a celebrity?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:100),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SignInButton(
                          Buttons.Google,
                          elevation: 10,
                          onPressed: () {
                            UserModel user = UserModel(
                              uid: "",
                              picture_url: "",
                              phone_number: "",
                              email_address: "",
                              user_name: "",
                              balance: 0
                            );

                            print('frf');

                            context.read<AuthProvider>().signInWithGoogle(
                                user: user,
                                log: (log) {
                                  print(log);

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: new Text('Message'),
                                      content: Text(log),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop(); // dismisses only the dialog and returns nothing
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                moveNextScreen: () {
                                  Navigator.pushReplacement(context,
                                      CupertinoPageRoute(builder: (context) {
                                        return userHome();
                                      }));
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
