

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp_Verification extends StatefulWidget {
  const Otp_Verification({Key? key}) : super(key: key);

  @override
  _Otp_VerificationState createState() => _Otp_VerificationState();
}

class _Otp_VerificationState extends State<Otp_Verification> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: PinFieldAutoFill(

            onCodeSubmitted:(pin){} ,//code submitted callback

            codeLength:6 //code length, default 6
        ),
      )
    );
  }
}
