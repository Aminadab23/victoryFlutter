import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/auth/login_page.dart';
import 'package:victory/home/home.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady(){

    super.onReady();
_user = Rx<User?>(auth.currentUser);
//user will be notified by this line
_user.bindStream(auth.userChanges());
// here is how we know user is loged in or not.
  ever(_user, _initialScreens);
  }
_initialScreens(User? user){
    if (user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    } else{
      Get.offAll(()=>WelcomePage(email: user.email!));
    }
}

void register(String email, password) async{
    try {
     await auth.createUserWithEmailAndPassword(email: email, password: password);



    } catch(e){
     Get.snackbar("About user", "User message",
     snackPosition: SnackPosition.BOTTOM,
     titleText: Text("Account creation failed"),
     messageText: Text(e.toString(),
     style: TextStyle(
       color: Colors.white
     ),
     ),
     );
    }
}

void login(String email, password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e){
      Get.snackbar("About Login", "Login message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Login failed"),
        messageText: Text(e.toString(),
          style: TextStyle(
              color: Colors.white
          ),
        ),
      );
    }
  }
void logout() async{
    await auth.signOut();
}
}