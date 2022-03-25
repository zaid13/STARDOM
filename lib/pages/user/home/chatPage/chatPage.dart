import 'package:cameo/util/colorScheme.dart';
import 'package:cameo/util/textStyles.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";



class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: backBlack,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Container(
                      width: width,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.tribune.com.pk/media/images/hasan1637951782-0/hasan1637951782-0.jpg",
                                ),
                                radius: 30,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              padding: EdgeInsets.all(3),
                              child: Container(
                                child: Text("Hassan Raheem",style: sofiaStyle(color: Colors.white, fontSize: 15, bold: true),textAlign: TextAlign.left,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:20),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(64, 72, 90,1),
                              ),
                              padding: EdgeInsets.all(15),
                              width: width*0.6,
                              child: Center(
                                  child: Text(
                                    "Hello, I am hassan hope you guys are doign well."*5,
                                    style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false),
                                    textAlign: TextAlign.left,
                                  )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(top:20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(122, 129, 148,1),
                              ),
                              padding: EdgeInsets.all(15),
                              width: width*0.6,
                              child: Center(
                                  child: Text(
                                    "Hello, I am hassan hope you guys are doign well."*5,
                                    style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false),
                                    textAlign: TextAlign.left,
                                  )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(top:20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(64, 72, 90,1),
                              ),
                              padding: EdgeInsets.all(15),
                              width: width*0.6,
                              child: Center(
                                  child: Text(
                                    "Hello, I am hassan hope you guys are doign well."*5,
                                    style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false),
                                    textAlign: TextAlign.left,
                                  )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(top:20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(64, 72, 90,1),
                              ),
                              padding: EdgeInsets.all(15),
                              width: width*0.6,
                              child: Center(
                                  child: Text(
                                    "Hello, I am hassan hope you guys are doign well."*5,
                                    style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false),
                                    textAlign: TextAlign.left,
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: height,
                width: width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                      decoration: InputDecoration(
                        suffixIcon: TextButton(
                          onPressed: (){
                            print("pressed");
                          },
                          child: Icon(Icons.send,color: Colors.black.withOpacity(0.8),),
                        ),
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        focusColor: Colors.red,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
