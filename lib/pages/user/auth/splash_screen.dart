import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:stardom/pages/user/auth/login.dart';

import '../../../providers/AuthProvider.dart';
import '../home/userHomePage/user_home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {


    Future.delayed(Duration(seconds: 3),() async {
      if( await context.read<AuthProvider>().isUserLoggedIn()){

        await context.read<AuthProvider>().syncUser();
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) {
              return userHome();
            }));

      }else{


        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context){
              return userLogin();
            })
        );

      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromRGBO(137, 12, 235, 1),
                  const Color.fromRGBO(43, 12, 235, 0.85),
                ])),
        height: height,
        child: Center(
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: width*0.8,
                        height: height,
                        child: Align(
                          alignment: Alignment.bottomRight,
                            child: Image.asset("images/backSplash.png",fit: BoxFit.contain,scale:0.1 ,)
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(width*0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:100),
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

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
