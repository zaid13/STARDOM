import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  late FirebaseAuth _auth;
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  //Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  Stream<UserModel> get user => _auth.authStateChanges().map(_userFromFirebase);

  AuthProvider() {
    //initialise object
    _auth = FirebaseAuth.instance;

    //listener for authentication changes such as user sign in and sign out
    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  //Create user object based on the given User
  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return UserModel(user_name: 'Null', uid: 'null', picture_url: "", email_address: '', phone_number: '', password: '');
    }

    return UserModel(
        uid: user.uid,
        email_address: user.email??"",
        picture_url: user.photoURL??"",
        phone_number:  user.phoneNumber??"",
        user_name: user.displayName??"",
        password: '');
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

  //Method for new user registration using email and password
  Future<UserModel> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      _status = Status.Registering;
      notifyListeners();
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await users.add(_userFromFirebase(result.user).toJson());

      return _userFromFirebase(result.user);
    } catch (e) {
      print("Error on the new user registration = " + e.toString());
      _status = Status.Unauthenticated;
      notifyListeners();
      return UserModel( uid: 'null', email_address: '', password: '', user_name: 'Null', phone_number: '', picture_url: '');
    }
  }
  //Method for new user registration using phone and password
   registerWithPhoneAndPassword(
      String phone, String password,UserModel user) async {
    // try {
    //   _status = Status.Registering;
    //   notifyListeners();
    //
    //   UserModel user = UserModel(
    //       uid: user.uid,
    //       email_address: user.email??"",
    //       picture_url: user.photoURL??"",
    //       phone_number:  user.phoneNumber??"",
    //       user_name: user.displayName??"",
    //       password: '');
    //
    //   await users.add(_userFromFirebase(result.user).toJson());
    //
    //   return _userFromFirebase(result.user);
    // } catch (e) {
    //   print("Error on the new user registration = " + e.toString());
    //   _status = Status.Unauthenticated;
    //   notifyListeners();
    //   return UserModel( uid: 'null', email_address: '', password: '', user_name: 'Null', phone_number: '', picture_url: '');
    // }
  }
  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("Error on the sign in = " + e.toString());
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }
   loginUser(String phone, BuildContext context, logger) async{

var _verificationId;
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 5),
          verificationCompleted:  (PhoneAuthCredential phoneAuthCredential) async {
            await _auth.signInWithCredential(phoneAuthCredential);
            logger("Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}");
          },
          verificationFailed:     (FirebaseAuthException authException) {

            logger('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
            print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
          },
          codeSent:  (String verificationId,  int? forceResendingToken) async {
            logger('Please check your phone for the verification code.');
            _verificationId = verificationId;

            try {
              final AuthCredential credential = PhoneAuthProvider.credential(
                verificationId: _verificationId,
                smsCode: _smsController.text,
              );

              final User? user = (await _auth.signInWithCredential(credential)).user;

              logger("Successfully signed in UID: ${user!.uid}");
            } catch (e) {
              logger("Failed to sign in: " + e.toString());
            }

          },
          codeAutoRetrievalTimeout:  (String verificationId) {
            logger("verification code: " + verificationId);
            _verificationId = verificationId;
          });
    } catch (e) {
      print("Failed to Verify Phone Number: ${e}");
    }
    // logger(_verificationId);
    return _verificationId;

  }


  //Method to handle password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}