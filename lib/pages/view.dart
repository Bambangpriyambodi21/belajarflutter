import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/pages/update.dart';

class ViewPage extends StatefulWidget{
  ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage>{
  List userdata = [];

  Future<void> deleteRecord(String id) async {
    try{
      String uri = "http://192.168.42.173/flutter/delete.php";
      var response = await http.post(Uri.parse(uri), body: {"id": id});
      var res = jsonDecode(response.body);

      if(res["success"]=="true"){
        print("Delete successfully");
        getrecord();
      }else{
        print("some issues");
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> getrecord() async{
    String uri = "http://192.168.42.173/flutter/view.php";
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>UpdatePage(
                          userdata[index]["email"],
                          userdata[index]["pass"],
                        )));
              },
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              title: Text(userdata[index]["email"]),
              subtitle: Text(userdata[index]["pass"]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteRecord(userdata[index]["id"]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}