import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  String email;
  String pass;
  UpdatePage(this.email,this.pass);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> updaterecord() async {
    try{
      String uri = "http://192.168.1.6/flutter/update.php";
      var res = await http.post(Uri.parse(uri), body: {
        "email":email.text,
        "pass":pass.text
      });

      var response = jsonDecode(res.body);

      if(response["success"]=="true"){
        print("Success Updated");
      }else{
        print("Error");
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    email.text=widget.email;
    pass.text=widget.pass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update data"),
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
                updaterecord();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 218, 93, 85),
              ),
              child: Text(
                "Register",
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
