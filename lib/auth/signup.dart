import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/auth/auth_controler.dart';
class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
   var emailContoller = TextEditingController();
   var passwordController = TextEditingController();
List images = [
  "google.jpg",
];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height ;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              width: w *0.3,
              height: h*0.2,
              child: Column(
                children: [
                  SizedBox(height: h *0.18,),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "img/prof.jpg"
                    ),
                  )
                ],
              ),

            ),
            SizedBox(height:120,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),


              child: Column(
                children: [
                  Text(
                    "Welcome To VICTORY!!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[500],
                        fontWeight: FontWeight.bold
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
                          hintText: "   your email here",
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
                          hintText: "   your password here",

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



                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(emailContoller.text.trim(), passwordController.text.trim());
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
                    "Sign up",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ) ,
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],

                ),
              ),
            ),
            SizedBox(height: w*0.05,),
            RichText(text: TextSpan(
                text: "sign up with..",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                ),

            ),
            ),
            Wrap(
              children: List<Widget>.generate(
                  1, (index)  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,

                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 20,
                            backgroundImage: AssetImage(
                              "img/"+images[index]
                            ),
                        ),
                      ),
                    );
              })
            ),
          ],
        ),
      ),
    );
  }
}
