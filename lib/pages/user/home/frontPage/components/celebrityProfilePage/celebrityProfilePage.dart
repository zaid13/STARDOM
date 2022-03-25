
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stardom/pages/user/home/chatPage/chatPage.dart';
import 'package:stardom/pages/user/home/videoRequestPage/videoRequestPage.dart';
import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';



var testingData=[
  1,2
];


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
        body: Container(
          margin: EdgeInsets.all(30),
          child: ListView(
            children: [
              
              Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(0)
                      )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      margin: EdgeInsets.only(top:25),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: backBlack,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            height: 40,
                            width: 130,
                            child: Center(
                              child: Text("Replies in : 7 Days",style: sofiaStyle(color: Colors.white, fontSize: 13, bold: false),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: Text("Hassan Raheem",style: sofiaStyle(color: Colors.white, fontSize: 30, bold: true),),
              ),
              Container(
                margin: EdgeInsets.only(top:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Musician",style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, bold: false),),
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
                child: Text("Description",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: true),),
              ),
              Container(
                margin: EdgeInsets.only(top:15),
                child: Text(
                "Hasan Raheem is a Pakistani born singer and songwriter. He has been one of the most streamed Pakistani singer on Spotify who has been producing songs in the hip-hop genre.",
                style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, bold: false),),
              ),
              GestureDetector(
                onTap: (){
                  print("messaged");
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return chatPage();
                  }));
                },
                child: Container(
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(49, 137, 255,1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      )
                  ),
                  margin: EdgeInsets.only(top:30),
                  child: Center(
                    child: Text(
                      "Message",
                      style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 18, bold: true),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("video Request Sent");
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return videoRequestPage();
                  }));
                },
                child: Container(
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(49, 137, 255,1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      )
                  ),
                  margin: EdgeInsets.only(top:15),
                  child: Center(
                    child: Text(
                      "Video Request",
                      style: sofiaStyle(color: Colors.white.withOpacity(0.8), fontSize: 18, bold: true),),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:50,bottom: 10),
                child: Text("Some Videos",style: sofiaStyle(color: Colors.white, fontSize: 20, bold: true),),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: testingData.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
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
                            width: width*0.4,
                            height: 200,
                          ),


                          Container(
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
                            width: width*0.4,
                            height: 200,
                          ),


                        ],
                      ),
                    );
                  }
                  ),
              SizedBox(height: 100,)

            ],
          ),
        )
        ),
    );
  }
}
