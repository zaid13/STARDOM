import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  //Create user object based on the given User
  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return UserModel(user_name: 'Null', uid: 'null', picture_url: "", email_address: '', phone_number: '', );
    }

    return UserModel(
        uid: user.uid,
        email_address: user.email??"",
        picture_url: user.photoURL??"",
        phone_number:  user.phoneNumber??"",
        user_name: user.displayName??"",);
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

    //Method for new user registration using Google
  Future<UserModel> registerWithGoogle(
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


        print("User Name: ${_user!.displayName}");
        print("User Email ${_user.email}");
        if(! await ifUserExists(_user.uid)){
          await users.add(_userFromFirebase(_user).toJson());
        }
        else{
          log("Already Registered");

        }

        moveNextScreen();

        return _userFromFirebase(_user);
      } catch (e) {
        log("Error on the new user registration = " + e.toString());
        _status = Status.Unauthenticated;
        notifyListeners();
        return UserModel( uid: 'null', email_address: '', user_name: 'Null', phone_number: '', picture_url: '');
      }
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


        print("User Name: ${_user!.displayName}");
        print("User Email ${_user.email}");

        if( await ifUserExists(_user.uid)){
          await users.add(_userFromFirebase(_user).toJson());
          moveNextScreen();
        }
        else{
          log("Please Sign Up");

        }




        return _userFromFirebase(_user);
      } catch (e) {
        log("Error on the new user registration = " + e.toString());
        _status = Status.Unauthenticated;
        notifyListeners();
        return UserModel( uid: 'null', email_address: '', user_name: 'Null', phone_number: '', picture_url: '');
      }
    }
  //Method for new user registration using email and password



  // Future<UserModel> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     _status = Status.Registering;
  //     notifyListeners();
  //     final UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     await users.add(_userFromFirebase(result.user).toJson());
  //
  //     return _userFromFirebase(result.user);
  //   } catch (e) {
  //     print("Error on the new user registration = " + e.toString());
  //     _status = Status.Unauthenticated;
  //     notifyListeners();
  //     return UserModel( uid: 'null', email_address: '', user_name: 'Null', phone_number: '', picture_url: '');
  //   }
  // }
  // //Method for new user registration using phone and password
  //  registerWithPhoneAndPassword(
  //     String phone, String password,UserModel user) async {
  //   // try {
  //   //   _status = Status.Registering;
  //   //   notifyListeners();
  //   //
  //   //   UserModel user = UserModel(
  //   //       uid: user.uid,
  //   //       email_address: user.email??"",
  //   //       picture_url: user.photoURL??"",
  //   //       phone_number:  user.phoneNumber??"",
  //   //       user_name: user.displayName??"",
  //   //       password: '');
  //   //
  //   //   await users.add(_userFromFirebase(result.user).toJson());
  //   //
  //   //   return _userFromFirebase(result.user);
  //   // } catch (e) {
  //   //   print("Error on the new user registration = " + e.toString());
  //   //   _status = Status.Unauthenticated;
  //   //   notifyListeners();
  //   //   return UserModel( uid: 'null', email_address: '', password: '', user_name: 'Null', phone_number: '', picture_url: '');
  //   // }
  // }
  // //Method to handle user sign in using email and password

  //
  // Future<bool> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     _status = Status.Authenticating;
  //     notifyListeners();
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     return true;
  //   } catch (e) {
  //     print("Error on the sign in = " + e.toString());
  //     _status = Status.Unauthenticated;
  //     notifyListeners();
  //     return false;
  //   }
  // }
  // signUp(_smsController ,Function routeToHomeScreen) async {
  //   if(_verificationId==null){
  //     print("verifcation id is null");
  //   }
  //   else{
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId,
  //       smsCode: _smsController,
  //     );
  //
  //     final User? user = (await _auth.signInWithCredential(credential)).user;
  //     currentUser.uid = user!.uid;
  //    if (! await ifUserExists(currentUser.uid)){
  //      await users.add((currentUser).toJson());
  //      print("Successfully register in UID: ${user!.uid}");
  //
  //    }
  //    else{
  //      print("Successfully signed in UID: ${user!.uid}");
  //
  //    }
  //     routeToHomeScreen();
  //
  //
  //
  //   }
  //   }

  //
  //  registerUserWithPhoneNumnber(UserModel user, BuildContext context, logger,routeToOtpScreen) async{
  //
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   try {
  //     await _auth.verifyPhoneNumber(
  //         phoneNumber: user.phone_number,
  //         timeout: const Duration(seconds: 40),
  //         verificationCompleted:  (PhoneAuthCredential phoneAuthCredential) async {
  //           // await _auth.signInWithCredential(phoneAuthCredential);
  //           // logger("Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}");
  //         },
  //         verificationFailed:     (FirebaseAuthException authException) {
  //
  //           logger('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
  //           print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
  //         },
  //         codeSent:  (String verificationId,  int? forceResendingToken) async {
  //
  //           _status = Status.Registering;
  //           notifyListeners();
  //
  //           logger('Please check your phone for the verification code.');
  //           currentUser = user;
  //           _verificationId = verificationId;
  //           routeToOtpScreen();
  //           try {
  //             // final AuthCredential credential = PhoneAuthProvider.credential(
  //             //   verificationId: _verificationId,
  //             //   smsCode: _smsController.text,
  //             // );
  //             //
  //             // final User? user = (await _auth.signInWithCredential(credential)).user;
  //             //
  //             // logger("Successfully signed in UID: ${user!.uid}");
  //           } catch (e) {
  //             logger("Failed to sign in: " + e.toString());
  //           }
  //
  //         },
  //         codeAutoRetrievalTimeout:  (String verificationId) {
  //           // logger("verification code: " + verificationId);
  //           _verificationId = verificationId;
  //         });
  //   } catch (e) {
  //     print("Failed to Verify Phone Number: ${e}");
  //   }
  //   // logger(_verificationId);
  //   return _verificationId;
  //
  // }


  //Method to handle password reset email
  // Future<void> sendPasswordResetEmail(String email) async {
  //   await _auth.sendPasswordResetEmail(email: email);
  // }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    FlutterRestart.restartApp();
    return Future.delayed(Duration.zero);
  }

  Future<bool> ifUserExists(String uid) async {
  QuerySnapshot snapshot =  await users.where("uid",isEqualTo: uid).get();
  if(snapshot.docs.length>0){
    return true;
  }
  return false;


  }
}