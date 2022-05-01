import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart' ;

import '../models/UserModel.dart';

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

  class AuthProvider extends ChangeNotifier {
  //Firebase Auth object
    late GoogleSignIn _googleSignIn ;

    late FirebaseAuth _auth;
    late UserModel currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');




  //Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  Stream<UserModel> get user => _auth.authStateChanges().map(_userFromFirebase);

  AuthProvider() {
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
  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return UserModel(user_name: 'Null', uid: 'null', picture_url: "", email_address: '', phone_number: '',balance: 0 );
    }

    return UserModel(
        uid: user.uid,
        email_address: user.email??"",
        picture_url: user.photoURL??"",
        phone_number:  user.phoneNumber??"",
        user_name: user.displayName??"",
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


    Future<UserModel> signInWithGoogle(
        {required UserModel user,required  Function log,required  Function moveNextScreen}) async {
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

        // if( await ifUserExists(_user.uid)){
        //   await users.add(_userFromFirebase(_user).toJson());
        //   moveNextScreen();
        // }
        // else{
        //   log("Please Sign Up");
        //
        // }

        moveNextScreen();


        return _userFromFirebase(_user);
      } catch (e) {
        log("Error on the new user registration = " + e.toString());
        _status = Status.Unauthenticated;
        notifyListeners();
        return UserModel( uid: 'null', email_address: '', user_name: 'Null', phone_number: '', picture_url: '',balance: 0.0);
      }
    }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    FlutterRestart.restartApp();
    return Future.delayed(Duration.zero);
  }

  updateUser(UserModel user) async {
    currentUser=user;
     QuerySnapshot querySnapshot =  await users.where("uid",isEqualTo:user. uid).get();
    users.doc(querySnapshot.docs[0].id).update(user.toJson());

  }
  syncUser(){
   this. currentUser=  _userFromFirebase( _auth.currentUser);
  }

  Future<bool> ifUserExists(String uid) async {
  QuerySnapshot snapshot =  await users.where("uid",isEqualTo: uid).get();
  if(snapshot.docs.length>0){
    return true;
  }
  return false;


  }



    Future<String> uploadImageToFirebaseGetUrl(String  image) async {


      UploadTask uploadTask =   FirebaseStorage.instance.ref("users/${currentUser.uid}").putFile(File(image));

      TaskSnapshot snapshot =await uploadTask;
    return  await snapshot.ref.getDownloadURL();



    }
}