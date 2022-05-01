import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stardom/pages/user/home/frontPage/components/celebrityCard.dart';
import 'package:stardom/pages/user/home/frontPage/components/searchPage/components/searchPageRow.dart';
import 'package:stardom/util/colorScheme.dart';
import "package:flutter/material.dart";

var testingData=[
  1,2,3,4
];


class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
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
            margin: EdgeInsets.all(20),
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: width,
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                    decoration: InputDecoration(
                      hintText: "Atif Aslam",
                      prefixIcon: Container(
                        child: Icon(Icons.search,color: Colors.black,),
                      ),
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
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("celebrityUsers").snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      QuerySnapshot<Object?>? data=snapshot.data;
                      var docs= data?.docs;
                      print(docs);
                      
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: testingData.length+1,
                            itemBuilder: (context,index){
                              if(index==testingData.length){
                                return SizedBox(
                                  height: 100,
                                );
                              }
                              else{
                                return Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        searchPageRow(),
                                        searchPageRow(),
                                      ],
                                    )
                                );
                              }
                            }
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
