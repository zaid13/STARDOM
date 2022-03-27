import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';
import "package:flutter/material.dart";

var testingData=[
  1,2,3,4,
];

class notificationsPage extends StatefulWidget {
  const notificationsPage({Key? key}) : super(key: key);

  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
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
                      padding: EdgeInsets.only(top:15),
                      margin: EdgeInsets.all(15),
                      child: Text("Notifications",style: sofiaStyle(color: Colors.white, fontSize: 36, bold: true),)
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10),
                    padding: EdgeInsets.only(top:20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(41, 47, 63,1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: testingData.length,
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            margin: EdgeInsets.only(top:5,bottom: 5),
                            width: width,
                            height: 80,
                            child: Row(
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
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            child: Text("Hassan Raheem",style: sofiaStyle(color: Colors.white, fontSize: 15, bold: true),textAlign: TextAlign.left,),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            child: Text(
                                              "Hassan Raheem has replied to your message Request.",
                                              style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, bold: false),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("9:37 AM",style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 15, bold:false),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },

                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
