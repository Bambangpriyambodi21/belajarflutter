import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> insertrecord() async {
    if(email.text!=""||pass.text!=""){
      try {
        String uri = "http://192.168.42.173/flutter/login.php";
        var res = await http.post(Uri.parse(uri), body: {
          "email":email.text,
          "pass":pass.text
        });

        var response = jsonDecode(res.body);

        if(response["success"]=="true"){
          print("Success Login");
          setState(() {
            Navigator.pushNamed(context, '/menupage');
          });
        }else{
          print("Login error");
        }
      }catch(e){
        print(e);
      }
    }else{
      print("Please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: GoogleFonts.dmSerifDisplay(),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  label: Text(
                    "Email : ",
                    style: GoogleFonts.dmSerifDisplay(),
                  )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),
            child: TextFormField(
              controller: pass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  label: Text(
                    "Password : ",
                    style: GoogleFonts.dmSerifDisplay(),
                  )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),

            child: ElevatedButton(
              onPressed: () {
                insertrecord();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 218, 93, 85),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
