import 'package:stardom/pages/user/home/frontPage/components/celebrityProfilePage/celebrityProfilePage.dart';
import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";


class searchPageRow extends StatefulWidget {
  const searchPageRow({Key? key}) : super(key: key);

  @override
  _searchPageRowState createState() => _searchPageRowState();
}

class _searchPageRowState extends State<searchPageRow> {
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
            width: width*0.42,
            height: 200,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              width: width*0.42,
              height: 200,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)),
                  ),
                  height: 50,
                  width: width,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Hassan Raheem",
                                  style: sofiaStyle(color: Colors.black.withOpacity(0.8), fontSize: 18, bold: true),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
          // Container(
          //   // padding: EdgeInsets.all(15),
          //   // color: Colors.red,
          //   // color: Colors.red,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         borderRadius: BorderRadius.all(Radius.circular(20))
          //     ),
          //     child: Container(
          //       padding: EdgeInsets.all(15),
          //       child: Container(
          //           decoration: BoxDecoration(
          //               color: backBlack,
          //               borderRadius: BorderRadius.all(Radius.circular(5))
          //           ),
          //           height: 40,
          //           width: 100,
          //           child: Center(
          //             child: Text("Available",style: sofiaStyle(color: Colors.white, fontSize: 13, bold: false),
          //             ),
          //           )),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
