import 'package:cameo/pages/user/home/chatPage/chatPage.dart';
import 'package:cameo/pages/user/home/requestsPage/requestsPage.dart';
import 'package:cameo/pages/user/home/userHomePage/user_home.dart';
import 'package:cameo/util/colorScheme.dart';
import 'package:cameo/util/textStyles.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";


var someone=1;

class videoRequestDetails extends StatefulWidget {
  const videoRequestDetails({Key? key}) : super(key: key);

  @override
  _videoRequestDetailsState createState() => _videoRequestDetailsState();
}

class _videoRequestDetailsState extends State<videoRequestDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: backBlack,
          body: Container(
            margin: EdgeInsets.all(30),
            child: ListView(
              children: [

                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://i.tribune.com.pk/media/images/hasan1637951782-0/hasan1637951782-0.jpg",
                            ),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    margin: EdgeInsets.only(top:25),
                    height: 400,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text("Hassan Raheem X#X",style: sofiaStyle(color: Colors.white, fontSize: 30, bold: true),),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Usually Responds in: 7 days.",style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, bold: false),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star,color: Colors.yellow.withOpacity(0.8),size: 15,),
                          Container(
                              padding: EdgeInsets.only(left:5),
                              child: Text("4.3 (180)",style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, bold: false),)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text("For",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: false),),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            someone=1;
                          });
                        },
                        child: Container(
                          width: width*0.4,
                          height: 40,
                          decoration: BoxDecoration(
                              color: someone==1?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3)
                              )
                          ),
                          child: Center(
                            child: Text(
                              "Someone",
                              style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 18, bold: true),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            someone=0;
                          });
                        },
                        child: Container(
                          width: width*0.4,
                          height: 40,
                          decoration: BoxDecoration(
                              color: someone==0?Color.fromRGBO(49, 137, 255,1):Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3)
                              )
                          ),
                          child: Center(
                            child: Text(
                              "Myself",
                              style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 18, bold: true),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text("Your Name",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: false),),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                    decoration: InputDecoration(
                      hintText: "Hamza Hassan",
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
                someone==1?Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text("Their Name",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: false),),
                ):Container(),
                someone==1?Container(
                  width: width,
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                    decoration: InputDecoration(
                      hintText: "Hamza Hassan",
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
                ):Container(),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text("Video For",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: false),),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                    decoration: InputDecoration(
                      hintText: "Apology, Birthday etc.",
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
                  margin: EdgeInsets.only(top:30),
                  child: Text("What do you want them to say?",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: false),),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                    decoration: InputDecoration(
                      hintText: "Apology, Birthday etc.",
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
                  margin: EdgeInsets.only(top:70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Request Status :",
                        style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false)
                      ),
                      GestureDetector(
                        onTap: (){
                          print("messaged");
                          Navigator.push(context, CupertinoPageRoute(builder: (context){
                            return requestsPage();
                          }));
                        },
                        child: Container(
                          width: width*0.25,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(49, 137, 255,1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3)
                              )
                          ),
                          child: Center(
                            child: Text(
                              "Pending",
                              style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 15, bold: true),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  height: 400,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size: 250,color: Colors.white.withOpacity(0.6),),
                        Text("Your Video will appear here,\nwhen it's ready.",style: sofiaStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, bold: false),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:50),
                  child: Center(child: Text("How do refunds work?",style: sofiaStyle(color: Colors.white, fontSize: 15, bold: false),)),
                ),


                SizedBox(height: 100,)

              ],
            ),
          )
      ),
    );
  }
}
