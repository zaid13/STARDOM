import 'package:cameo/pages/user/home/frontPage/components/celebrityCard.dart';
import 'package:cameo/pages/user/home/frontPage/frontPage.dart';
import 'package:cameo/pages/user/home/notificationsPage/notificationsPage.dart';
import 'package:cameo/pages/user/home/profilePage/profilePage.dart';
import 'package:cameo/pages/user/home/requestsPage/requestsPage.dart';
import 'package:cameo/util/colorScheme.dart';
import 'package:cameo/util/textStyles.dart';
import "package:flutter/material.dart";



var pages=[
  frontPage(),
  requestsPage(),
  notificationsPage(),
  profilePage()
];

var currentPage=0;

class userHome extends StatefulWidget {

  @override
  _userHomeState createState() => _userHomeState();
}

class _userHomeState extends State<userHome> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(0),
          width: width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      currentPage=0;
                    });
                  },
                    child: Icon(Icons.home,size: 30, color: currentPage==0?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.6),)
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      currentPage=1;
                    });
                  },
                    child: Icon(Icons.send,size: 30,color: currentPage==1?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.6),)
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        currentPage=2;
                      });
                    },
                    child: Icon(Icons.notifications,size: 30,color: currentPage==2?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.6))),
              ),
              Container(
                height: 50,
                width: 50,
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        currentPage=3;
                      });
                    },
                    child: Icon(Icons.person,size: 30,color: currentPage==3?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.6))),
              ),

            ],
          ),
        ),
        backgroundColor: backBlack,
        body: pages[currentPage]
      ),
    );
  }
}
