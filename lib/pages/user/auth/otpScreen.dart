// import 'package:flutter/cupertino.dart';
// import "package:flutter/material.dart";
// import 'package:stardom/pages/user/home/userHomePage/user_home.dart';
// import 'package:stardom/util/colorScheme.dart';
// import 'package:stardom/util/textStyles.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:provider/provider.dart';
//
// import '../../../providers/AuthProvider.dart';
//
// var otp = TextEditingController(text: "");
//
// class otpScreen extends StatefulWidget {
//   const otpScreen({Key? key}) : super(key: key);
//
//   @override
//   _otpScreenState createState() => _otpScreenState();
// }
//
// class _otpScreenState extends State<otpScreen> {
//   TextEditingController pinCtrl = TextEditingController();
//
//   @override
//   void initState() {
//
//      SmsAutoFill().listenForCode;
//
//     super.initState();
//   }
//
//
//   @override
//   void dispose() {
//     SmsAutoFill().unregisterListener();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: backBlack,
//       body: Container(
//         height: height,
//         width: width,
//         child: Center(
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               Center(
//                   child: Text(
//                       "Kindly enter the one time OTP\nsent to your mobile",
//                     style: sofiaStyle(color: Colors.white, fontSize: 24),
//                     textAlign: TextAlign.center,
//                   )
//               ),
//               SizedBox(height: 120,),
//
//               PinFieldAutoFill(
//                 controller:pinCtrl ,
//                   decoration: UnderlineDecoration(
//                     textStyle: TextStyle(fontSize: 20, color: Colors.white,  fontWeight: FontWeight.w400,
//                         fontFamily: "Ubuntu"),
//                     colorBuilder: FixedColorBuilder(Colors.white.withOpacity(0.3)),
//                   ),                  onCodeSubmitted:(pin){} ,//code submitted callback
//
//                   codeLength:6 //code length, default 6
//               ),
//               // Center(
//               //   child: Container(
//               //     width: width * 0.8,
//               //     margin: EdgeInsets.only(top: 20),
//               //     child: TextField(
//               //       keyboardType: TextInputType.number,
//               //       controller: otp,
//               //       style: TextStyle(
//               //           fontSize: 30,
//               //           color: Colors.black.withOpacity(0.8),
//               //           fontWeight: FontWeight.w400,
//               //           fontFamily: "Ubuntu"),
//               //       decoration: InputDecoration(
//               //         suffixIcon: TextButton(
//               //           onPressed: () {
//               //             print("pressed");
//               //           },
//               //           child: Icon(
//               //             Icons.remove_red_eye,
//               //             color: Colors.black.withOpacity(0.8),
//               //           ),
//               //         ),
//               //         hintText: "4 2 0 0",
//               //         contentPadding: EdgeInsets.all(15),
//               //         filled: true,
//               //         focusColor: Colors.red,
//               //         fillColor: Colors.white.withOpacity(0.7),
//               //         border: OutlineInputBorder(
//               //           borderSide: BorderSide.none,
//               //           borderRadius: BorderRadius.circular(15),
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               SizedBox(height: 30,),
//               Center(
//                 child: Container(
//                   width: width*0.8,
//                   margin: EdgeInsets.only(top: 40),
//                   child: Center(
//                     child: ElevatedButton(
//                         onPressed: (){
//                           context.read<AuthProvider>().signUp(pinCtrl.value.text,(){
//                             Navigator.pushReplacement(
//                                 context,
//                                 CupertinoPageRoute(builder: (context){
//                                   return userHome();
//                                 })
//                             );
//                           });
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           elevation: 10,
//                           primary: Color.fromRGBO(49, 137, 255,1),
//                           shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                         ),
//                         child: Center(
//                           child: Text("Verify",style: TextStyle(fontFamily: "Sofia Pro",fontWeight: FontWeight.w700,fontSize: 18),),
//                         )
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
