
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stardom/pages/celeb/auth/celebLogin.dart';
import 'package:stardom/pages/celeb/home/celebHomePage/celebHomePage.dart';


class celebSignup extends StatefulWidget {

  @override
  _celebSignupState createState() => _celebSignupState();
}

class _celebSignupState extends State<celebSignup> {
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
                            margin: EdgeInsets.only(top:20),
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
                      width: width,
                      margin: EdgeInsets.only(top: 100),
                      child: TextField(
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
                                    return celebHomePage();
                                  })
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              primary: Color.fromRGBO(49, 137, 255,1),
                              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            ),
                            child: Center(
                              child: Text("Sign Up",style: TextStyle(fontFamily: "Sofia Pro",fontWeight: FontWeight.w700,fontSize: 18),),
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
                                return celebLogin();
                              })
                          );
                        },
                        child: Text(
                          "Already have an account ? Login Here.",
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
