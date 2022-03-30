import "package:flutter/material.dart";
import 'package:stardom/util/colorScheme.dart';
import 'package:stardom/util/textStyles.dart';

class celebrityWallet extends StatefulWidget {
  const celebrityWallet({Key? key}) : super(key: key);

  @override
  _celebrityWalletState createState() => _celebrityWalletState();
}

class _celebrityWalletState extends State<celebrityWallet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backBlack,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                "Current Balance is",
                style: sofiaStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "20,000 PKR",
                style: sofiaStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Center(
              child: Container(
                width: width * 0.8,
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     CupertinoPageRoute(builder: (context){
                        //       return celebrityWallet();
                        //     })
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Color.fromRGBO(49, 137, 255, 1),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      child: Center(
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              fontFamily: "Sofia Pro",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.yellow,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                        "Hamza Hassan",
                                        style: sofiaStyle(
                                            color: Colors.white, fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  Flexible(
                                      child: Text(
                                        "Video Request",
                                        style: sofiaStyle(
                                            color: Colors.white.withOpacity(0.6), fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "5000 PKR",
                              style: sofiaStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 20,
                                  bold: true),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.yellow,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                        "Hamza Hassan",
                                        style: sofiaStyle(
                                            color: Colors.white, fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  Flexible(
                                      child: Text(
                                        "Video Request",
                                        style: sofiaStyle(
                                            color: Colors.white.withOpacity(0.6), fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "5000 PKR",
                              style: sofiaStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  bold: true),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
