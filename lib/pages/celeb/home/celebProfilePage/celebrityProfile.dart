import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:stardom/pages/celeb/home/celebHomePage/celebHomePage.dart';
import 'package:stardom/pages/celeb/home/celebrityWallet/celebrityWallet.dart';
import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';


class celebrityProfilePage extends StatefulWidget {
  const celebrityProfilePage({Key? key}) : super(key: key);

  @override
  _celebrityProfilePageState createState() => _celebrityProfilePageState();
}

class _celebrityProfilePageState extends State<celebrityProfilePage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backBlack,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
              height: height,
              width: width,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 15),
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Profile",
                        style: sofiaStyle(
                            color: Colors.white, fontSize: 36, bold: true),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(41, 47, 63, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/backBlurred.jpg"),
                                            fit: BoxFit.cover)),
                                    width: width * 0.42,
                                    height: 200,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    width: width * 0.42,
                                    height: 200,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image,size: 100,color: Colors.white.withOpacity(0.6),),
                                        Text("Add intro video",
                                          style: sofiaStyle(
                                            color: Colors.white.withOpacity(0.6),
                                            fontSize: 18,
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hamza Hassan",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              bold: true),
                                        ),
                                        SizedBox(width: 10,),
                                        Icon(Icons.edit,color: Colors.white,)
                                      ],
                                    ))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              width: width,
                              child: TextField(
                                style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                                decoration: InputDecoration(
                                  hintText: "hassanhamza930@gmail.com",
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
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Phone",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              width: width,
                              child: TextField(
                                style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                                decoration: InputDecoration(
                                  hintText: "+923174631189",
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
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Password",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              width: width,
                              child: TextField(
                                style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                                decoration: InputDecoration(
                                  suffixIcon: TextButton(
                                    onPressed: (){
                                      print("pressed");
                                    },
                                    child: Icon(Icons.remove_red_eye,color: Colors.black.withOpacity(0.8),),
                                  ),
                                  hintText: "testing123",
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
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Category",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: width*0.9,
                              child: Wrap(
                                spacing: 10,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:15,right: 15,top: 10,bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                        Radius.circular(20)
                                      )
                                    ),
                                    child: Text("Testing",style: sofiaStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left:15,right: 15,top: 10,bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)
                                        )
                                    ),
                                    child: Text("Testing",style: sofiaStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left:15,right: 15,top: 10,bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)
                                        )
                                    ),
                                    child: Text("Testing",style: sofiaStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),),
                                  ),
                                ]
                              )
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Message Request Charges",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              width: width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width*0.4,
                                      child: TextField(
                                        style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                                        decoration: InputDecoration(
                                          hintText: "5000Rs",
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
                                    SizedBox(width: 20,),
                                    Icon(Icons.edit,color: Colors.white,size: 24,)
                                  ],
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Video Request Charges",
                                          style: sofiaStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              bold: true),
                                        ),
                                      ],
                                    ))),
                            Container(
                              width: width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width*0.4,
                                      child: TextField(
                                        style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                                        decoration: InputDecoration(
                                          hintText: "10000Rs",
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
                                    SizedBox(width: 20,),
                                    Icon(Icons.edit,color: Colors.white,size: 24,)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Center(
                                child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(builder: (context){
                                            return celebrityWallet();
                                          })
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      primary: Color.fromRGBO(49, 137, 255,1),
                                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    ),
                                    child: Center(
                                      child: Text("View Wallet",style: TextStyle(fontFamily: "Sofia Pro",fontWeight: FontWeight.w700,fontSize: 18),),
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            )

                          ],
                        )),
                  )
                ],
              )),
        ),
      ),
    );

  }
}
