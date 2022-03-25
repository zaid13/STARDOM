import 'package:cameo/pages/user/home/frontPage/components/celebrityCard.dart';
import 'package:cameo/pages/user/home/frontPage/components/searchPage/searchPage.dart';
import 'package:cameo/util/colorScheme.dart';
import 'package:cameo/util/textStyles.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

var selectedCategory=0;
var categories=[
  "Trending",
  "Art",
  "Youtubers",
  "Musicians",
  "Tiktokers"
];

class frontPage extends StatefulWidget {
  const frontPage({Key? key}) : super(key: key);

  @override
  _frontPageState createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backBlack,
      body: Container(
        margin: EdgeInsets.all(20),
        height: height,
        width: width,
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                  return searchPage();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(106, 106, 106,0.3).withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: width*0.8,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.search,color: Colors.white.withOpacity(0.6),),
                    SizedBox(width: 10,),
                    Text("Hassan Raheem",style: ubuntuStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, bold: false),),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              child: Text(
                "Celebrities are just a message away!",
                style: ubuntuStyle(color: Colors.white, fontSize: 30, bold: false),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              height: 35,
              width: width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){

                  if(selectedCategory==index){
                    return Container(
                      margin: EdgeInsets.only(right:10),
                      padding: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(49, 137, 255,1),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Center(
                          child: Text("${categories[index]}",style: sofiaStyle(color: Colors.white, fontSize: 15, bold: true),)
                      ),
                    );
                  }
                  else{
                    return TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.all(0)
                          )
                      ),
                      onPressed: (){
                        setState(() {
                          selectedCategory=index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right:10),
                        padding: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Center(
                            child: Text("${categories[index]}",style: sofiaStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, bold: true),)
                        ),
                      ),
                    );
                  }




                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              height: 400,
              width: width,
              // color: Colors.red,
              child: ListView(
                shrinkWrap: true,
                scrollDirection:Axis.horizontal,
                children: [
                  celebrityCard(),
                  celebrityCard(),
                  celebrityCard(),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
