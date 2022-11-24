import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:victory/auth/auth_controler.dart';
import 'package:victory/auth/login_page.dart';
import 'package:victory/home/home.dart';
import 'auth/signup.dart';
import 'package:get/get.dart';
import 'splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
home: LoginPage(),

    );
  }
}
