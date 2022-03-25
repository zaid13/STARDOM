import 'dart:ui';

import 'package:cameo/pages/user/home/frontPage/components/celebrityProfilePage/celebrityProfilePage.dart';
import 'package:cameo/util/colorScheme.dart';
import 'package:cameo/util/textStyles.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';


class celebrityCard extends StatefulWidget {
  const celebrityCard({Key? key}) : super(key: key);

  @override
  _celebrityCardState createState() => _celebrityCardState();
}

class _celebrityCardState extends State<celebrityCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context,CupertinoPageRoute(builder: (context){
          return celebrityProfilePage();
        }));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              image: DecorationImage(
                    image: NetworkImage(
                        "https://i.tribune.com.pk/media/images/hasan1637951782-0/hasan1637951782-0.jpg"
                    ),
                    fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            margin: EdgeInsets.only(right:20),
            width: width*0.8,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),

            ),
            margin: EdgeInsets.only(right:20),
            width: width*0.8,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)),
                ),
                height: 60,
                width: width,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                "Hassan Raheem",
                                style: sofiaStyle(color: Colors.black.withOpacity(0.8), fontSize: 25, bold: true),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                        ),
                      ),
                      Container(
                          width: 95,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(49, 137, 255,1),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              padding: EdgeInsets.only(top:10,bottom: 10,left: 15,right: 15),
                              child: Text(
                                "Request",
                                style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 15, bold: true),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
          Container(
            // padding: EdgeInsets.all(15),
            // color: Colors.red,
            // color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Container(
                    decoration: BoxDecoration(
                        color: backBlack,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    height: 35,
                    width: 80,
                    child: Center(
                      child: Text("Available",style: sofiaStyle(color: Colors.white, fontSize: 13, bold: false),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
