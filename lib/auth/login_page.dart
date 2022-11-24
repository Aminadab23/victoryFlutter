import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:victory/auth/auth_controler.dart';
import 'package:victory/auth/signup.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailContoller = TextEditingController();
var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height ;

  return Scaffold(
    backgroundColor: Colors.white,
body: Column(

  children: [
    Container(
      margin: EdgeInsets.all(50.0),
      width: w *0.8,
      height: h*0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "img/vl.jpg"
          )

        )
      ),

    ),
    Container(
      margin: EdgeInsets.only(left: 20,right: 20),


      child: Column(
    children: [
      Text(
        "Welcome To VICTORY!!",
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue[500],
          fontWeight: FontWeight.bold
        ),
      ),
      Text(
        "Log in o your account",
        style: TextStyle(
            fontSize: 15,
          color: Colors.grey[600],
        ),
      ),
      SizedBox(height: 30,),
      Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        spreadRadius: 7,
        offset: Offset(1,1),
        color: Colors.grey.withOpacity(0.2),
      )
    ]
  ),
  child:TextField(
controller: emailContoller,
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent,),
hintText: "Your email Id",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),

            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            )
        )
    ),
  ),
),
      SizedBox(height: 20,),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,1),
                color: Colors.grey.withOpacity(0.2),
              )
            ]
        ),
        child:TextField(
controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(

              prefixIcon: Icon(Icons.password_outlined, color: Colors.deepOrangeAccent,),
              hintText: "Your password ",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),

                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  )
              )
          ),
        ),
      ),
      SizedBox(height: 10,),
      Row(
  children: [
    Expanded(child: Container(),
      ),Text(
      "forgot password?",
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey[600],
      ),
    ),
  ],
),


      

    ],
  ),
),
    SizedBox(height: 20,),
    GestureDetector(
      onTap: (){
        AuthController.instance.login(emailContoller.text.trim(), passwordController.text.trim());
      },
      child: Container(
        width: w * 0.5,
        height: h*0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(
              "img/loginbtn.JPG"
            ),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Text(
            "Log in",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ) ,
      ),
    ),
    SizedBox(height: w*0.15,),
    RichText(text: TextSpan(
      text: "Dont have an account?",
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 20,
      ),
      children: [
    TextSpan(
    text: "   Create",

        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUp())
    ),
      ]
    ),
    ),

  ],
),
    );
  }
}
