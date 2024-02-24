import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPage extends StatefulWidget{
  ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage>{
  List userdata = [];
  Future<void> getrecord() async{
    String uri = "http://192.168.1.2/flutter/view.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata =jsonDecode(response.body);
      });
    }catch(e){
      print(e);
    }
  }

  @override
  void initState(){
    getrecord();
    super.initState();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(userdata[index]["email"]),
              subtitle: Text(userdata[index]["pass"]),
            ),
          );
        },
      ),
    );
  }
}