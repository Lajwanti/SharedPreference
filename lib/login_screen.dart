
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/home_screen.dart';
import 'package:shared_preference/student_screen.dart';
import 'package:shared_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 // final formData = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ageController = TextEditingController();
  final typeController = TextEditingController();
 var value = "-1";

 List<String> items = ["student","teacher","admin"];
 String? selectedItem = "student";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextField(

              controller: typeController,
              decoration: InputDecoration(
                hintText: "Select Type",
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    typeController.text = value;
                    print(value);

                  },
                  itemBuilder: (BuildContext context) {
                    return items
                        .map<PopupMenuItem<String>>((String value) {
                      return new PopupMenuItem(
                          child: new Text(value), value: value);
                    }).toList();
                  },
                ),
              ),
            ),



            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: "Psassword"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: InputDecoration(
                  hintText: "Age"
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () async {

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("age", ageController.text.toString());

                //admin, student, teacher
                sp.setString("type", typeController.text.toString());
                sp.setBool("isLogin", true);

                if(sp.getString("type")=="teacher"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));

                }
                else if(sp.getString("type")=="student"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));

                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                }



                print("tap");
                //function();

                //Shared Preference

                // SharedPreferences sp = await SharedPreferences.getInstance();
                // sp.setString("name", "Lajwanti");
                // sp.setInt("age", 20);
                // print(sp.getString("name"));
                // print(sp.getInt("age"));
                //
                // sp.remove("name");
                // print(sp.get("name"));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("Signup"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> function()async{
  //   await Future.delayed(Duration(seconds: 5));
  //   print("Hello");
  //
  //
  // }
}
