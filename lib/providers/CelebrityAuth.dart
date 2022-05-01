


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart' ;

import '../models/CelebrityModel.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Registering
}
/*
The UI will depends on the Status to decide which screen/action to be done.
- Uninitialized - Checking user is logged or not, the Splash Screen will be shown
- Authenticated - User is authenticated successfully, Home Page will be shown
- Authenticating - Sign In button just been pressed, progress bar will be shown
- Unauthenticated - User is not authenticated, login page will be shown
- Registering - User just pressed registering, progress bar will be shown
Take note, this is just an idea. You can remove or further add more different
status for your UI or widgets to listen.
 */

class CelebrityAuthProvider extends ChangeNotifier {
  //Firebase Auth object
  late GoogleSignIn _googleSignIn ;

  late FirebaseAuth _auth;
  late CelebrityModel celebrityModelUser;
  CollectionReference celebrityUsers = FirebaseFirestore.instance.collection('celebrityUsers');

  bool celebrityShouldBeblockOnsignup = false;




  //Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  Stream<CelebrityModel> get user => _auth.authStateChanges().map(_userFromFirebase);

  CelebrityAuthProvider() {
    //initialise object
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    //listener for authentication changes such as user sign in and sign out
    _auth.authStateChanges().listen(onAuthStateChanged);
  }
  Future<bool> isUserLoggedIn() async {
    if(await _auth.currentUser != null){
      syncUser();
      return true;
    }
    return false ;
  }

  //Create user object based on the given User
  CelebrityModel _userFromFirebase(User? user) {
    if (user == null) {
      return CelebrityModel(user_name: 'Null', uid: 'null', picture_url: "", email_address: '', phone_number: '',balance: 0 ,
          category:[],
          messageCategoryCharges:0.0,
          videoCategoryCharges:0.0,
        isActive: !celebrityShouldBeblockOnsignup

      );
    }

    return CelebrityModel(
      uid: user.uid,
      email_address: user.email??"",
      picture_url: user.photoURL??"",
      phone_number:  user.phoneNumber??"",
      user_name: user.displayName??"",
      category:[],
      messageCategoryCharges:0.0,
      videoCategoryCharges: 0.0,
      isActive:!celebrityShouldBeblockOnsignup,

      balance:0,);
  }

  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }


  Future<CelebrityModel> signInWithGoogle(
      {required CelebrityModel user,required  Function log,required  Function moveNextScreen}) async {
    try {
      _status = Status.Registering;
      notifyListeners();



      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCred = await _auth.signInWithCredential(credential);
      User? _user = userCred.user;
      assert(!_user!.isAnonymous);
      assert(await _user!.getIdToken() != null);
      User? currentUser = await _auth.currentUser;
      assert(_user!.uid == currentUser!.uid);

      syncUser();
      print("User Name: ${_user!.displayName}");
      print("User Email ${_user.email}");

      if(! await ifUserExists(_user.uid)){
        await celebrityUsers.add(_userFromFirebase(_user).toJson());
        moveNextScreen();
      }
      else{
        log("Please Sign Up");

      }

      moveNextScreen();


      return _userFromFirebase(_user);
    } catch (e) {
      log("Error on the new user registration = " + e.toString());
      _status = Status.Unauthenticated;
      notifyListeners();
      return CelebrityModel( uid: 'null', email_address: '', user_name: 'Null', phone_number: '', picture_url: '',balance: 0.0,

        category:[],
        messageCategoryCharges:0.0,
        videoCategoryCharges: 0.0,
        isActive:!celebrityShouldBeblockOnsignup,
      );
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    FlutterRestart.restartApp();
    return Future.delayed(Duration.zero);
  }

  updateUser(CelebrityModel user) async {
    celebrityModelUser=user;
    QuerySnapshot querySnapshot =  await celebrityUsers.where("uid",isEqualTo:user. uid).get();
    celebrityUsers.doc(querySnapshot.docs[0].id).update(user.toJson());

  }
  syncUser(){
    this. celebrityModelUser=  _userFromFirebase( _auth.currentUser);
  }

  Future<bool> ifUserExists(String uid) async {
    QuerySnapshot snapshot =  await celebrityUsers.where("uid",isEqualTo: uid).get();
    if(snapshot.docs.length>0){
      return true;
    }
    return false;


  }



  Future<String> uploadImageToFirebaseGetUrl(String  image) async {


    UploadTask uploadTask =   FirebaseStorage.instance.ref("celebrityUsers/${celebrityModelUser.uid}").putFile(File(image));

    TaskSnapshot snapshot =await uploadTask;
    return  await snapshot.ref.getDownloadURL();



  }
}