import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/home_screen.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preference/student_screen.dart';
import 'package:shared_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
    

  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
     bool islogin = sp.getBool("isLogin") ?? false;
     String type = sp.getString("type")??"";

     if(islogin){
       if(type=="student"){

         Timer(Duration(seconds: 5),(){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
         });
       }
       else if(type == "teacher"){
         Timer(Duration(seconds: 5),(){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
         });
       }
       else {
         Timer(Duration(seconds: 5),(){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
         });
       }



     }
     else{
       Timer(Duration(seconds: 5),(){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
       });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        fit: BoxFit.fitHeight,
          height: double.infinity,

          image: NetworkImage("https://images.pexels.com/photos/784632/pexels-photo-784632.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
    );
  }
}
