import 'package:flutter/material.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  String email="", age="", type="";


  @override
  void initState() {
    // TODO: implement initState
    loadData();

  }

  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email")??"";
    age = sp.getString("age")??"";
    type = sp.getString("type")??"";
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("TeacherScreen")),
            SizedBox(height: 30,),
            Center(child: Text(email.toString())),
            SizedBox(height: 30,),
            Center(child: Text(age.toString())),
            SizedBox(height: 30,),
            Center(child: Text(type.toString())),
            SizedBox(height: 30,),


            InkWell(
              onTap: () async {

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();

                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("LogOut"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
