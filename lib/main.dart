import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stardom/pages/celeb/home/celebRequests/cameraScreen.dart';
import 'package:stardom/pages/user/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash() ,
      // home:cameraScreen()
    );
  }
}
