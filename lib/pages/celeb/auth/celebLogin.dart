
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:stardom/models/UserModel.dart';
import 'package:stardom/pages/celeb/home/celebHomePage/celebHomePage.dart';
import 'package:stardom/pages/user/home/userHomePage/user_home.dart';
import 'package:stardom/providers/AuthProvider.dart';



class celebLogin extends StatefulWidget {
  const celebLogin({Key? key}) : super(key: key);

  @override
  _celebLoginState createState() => _celebLoginState();
}

class _celebLoginState extends State<celebLogin> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromRGBO(235, 12, 119, 1),
                      const Color.fromRGBO(137, 12, 235, 0.85),
                    ])),
            height: height,
            child: Container(
              height: height,
              margin: EdgeInsets.all(width*0.1),
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
                              style: TextStyle(color: Colors.white,fontFamily: "Ubuntu",fontSize: 70,fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20,left:5),
                            width: width,
                            child: Text(
                              "For Celebs.",
                              style: TextStyle(color: Colors.white,fontFamily: "Ubuntu",fontSize: 30,fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
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
