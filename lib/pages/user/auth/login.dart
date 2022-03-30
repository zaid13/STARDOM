

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stardom/pages/celeb/auth/celebLogin.dart';
import 'package:stardom/pages/user/auth/signup.dart';
import 'package:stardom/pages/user/home/userHomePage/user_home.dart';

var fullName=TextEditingController(text: "");
var password=TextEditingController(text: "");


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
                            margin: EdgeInsets.only(top:20),
                            width: width,
                            child: Text(
                              "Celebrities are just a message away.",
                              style: TextStyle(color: Colors.white,fontFamily: "Ubuntu",fontSize: 30,fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(5)
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context){
                                    return celebLogin();
                                  })
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top:20),
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
                      width: width,
                      margin: EdgeInsets.only(top: 100),
                      child: TextField(
                        controller: phone,
                        style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                        decoration: InputDecoration(
                          hintText: "Phone",
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          focusColor: Colors.red,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: password,
                        style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                        decoration: InputDecoration(
                          suffixIcon: TextButton(
                            onPressed: (){
                              print("pressed");
                            },
                            child: Icon(Icons.remove_red_eye,color: Colors.black.withOpacity(0.8),),
                          ),
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          focusColor: Colors.red,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(builder: (context){
                                    return userHome();
                                  })
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                            primary: Color.fromRGBO(49, 137, 255,1),
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            ),
                            child: Center(
                              child: Text("Log In",style: TextStyle(fontFamily: "Sofia Pro",fontWeight: FontWeight.w700,fontSize: 18),),
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:40),
                      width: width,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(0)
                          ),
                        ),
                        onPressed: (){
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(builder: (context){
                                return userSignup();
                              })
                          );
                        },
                        child: Text(
                          "Haven't signed up yet ? Signup Here.",
                          style: TextStyle(color: Colors.white,fontFamily: "Sofia Pro",fontSize: 15,fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:10),
                      width: width,
                      child: Text(
                        "Forgot password.",
                        style: TextStyle(color: Colors.white,fontFamily: "Sofia Pro",fontSize: 15,fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
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
