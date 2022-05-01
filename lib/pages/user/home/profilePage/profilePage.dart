import 'dart:io';

import 'package:provider/provider.dart';
import 'package:stardom/models/UserModel.dart';
import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../../../../providers/AuthProvider.dart';
import 'package:image_picker/image_picker.dart';

UserModel currentUser =
    UserModel(email_address: "", phone_number: "", picture_url: "", uid: "", user_name: "", balance: 0.0);

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  TextEditingController phone = TextEditingController();

  String imgUrl = "https://pbs.twimg.com/profile_images/1514306828913758214/mlKNRfdI_400x400.jpg";
  String pickedImage = '';
  bool isEditmode = false;

  @override
  void initState() {
    fetch() async {
      UserModel user = await context.read<AuthProvider>().user.first;
      setState(() {
        currentUser = user;
        phone.text = user.phone_number;
        imgUrl = user.picture_url;
      });
    }

    fetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backBlack,
        body: Container(
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
                      style: sofiaStyle(color: Colors.white, fontSize: 36, bold: true),
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
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(imgUrl) as ImageProvider, fit: BoxFit.cover)),
                                  width: width * 0.5,
                                  height: 200,
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
                                    "${currentUser.user_name}",
                                    style: sofiaStyle(color: Colors.white, fontSize: 35, bold: true),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
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
                                        "Email",
                                        style: sofiaStyle(color: Colors.white, fontSize: 18, bold: true),
                                      ),
                                    ],
                                  ))),
                          Container(
                            width: width,
                            child: TextField(
                              readOnly: true,
                              enabled: false,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Ubuntu"),
                              decoration: InputDecoration(
                                hintText: "${currentUser.email_address}",
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
                                        style: sofiaStyle(color: Colors.white, fontSize: 18, bold: true),
                                      ),
                                    ],
                                  ))),
                          Container(
                            width: width,
                            child: TextField(
                              readOnly: true,
                              keyboardType: TextInputType.phone,
                              controller: phone,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Ubuntu"),
                              decoration: InputDecoration(
                                hintText: "${currentUser.phone_number}",
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
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<AuthProvider>().signOut();
                            },
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.red),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Log Out",
                                          style: sofiaStyle(color: Colors.white, fontSize: 18, bold: true),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      )),
                )
              ],
            )),
      ),
    );
  }
}
