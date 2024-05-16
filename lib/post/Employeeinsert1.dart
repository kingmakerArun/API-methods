import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Employeeinsert1 extends StatefulWidget {
  const Employeeinsert1({super.key});

  @override
  State<Employeeinsert1> createState() => _Employeeinsert1State();
}

class _Employeeinsert1State extends State<Employeeinsert1> {

  TextEditingController _employeeName= TextEditingController();
  TextEditingController _mobile= TextEditingController();
  TextEditingController _userName= TextEditingController();
  TextEditingController _password= TextEditingController();
  TextEditingController _confirmPassword= TextEditingController();


  Future<bool>? sus;
  Future<bool> func(String employeeName,String mobile,
      String userName,String password,String confirmPassword) async
  {
    var res = await http.post
      (Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
        headers: <String, String>
        {
          'Content-Type' : 'application/json; charset=utf-8',
        },
      body:jsonEncode(<String,dynamic>
      {
        "employeeId": 0,
        "employeeName": employeeName,
        "mobile": mobile,
        "userName": userName,
        "password": password,
        "confirmPassword": confirmPassword,
        "createdBy": 1
      })
    );
    return jsonDecode(res.body)["success"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (sus == null ? added() : addmessage()),
          ),
        ],
      ),
    );
  }
  Column added()
  {
    return Column(
    children: [
      TextFormField(
        controller: _employeeName,
        decoration: InputDecoration(
          label: Text("Enter employee name"),
        ),
      ),
      TextFormField(
        controller: _mobile,
        decoration: InputDecoration(
          label: Text("Enter mobile no"),
        ),
      ),
      TextFormField(
        controller: _userName,
        decoration: InputDecoration(
          label: Text("Enter user name"),
        ),
      ),
      TextFormField(
        controller: _password,
        decoration: InputDecoration(
          label: Text("Enter password"),
        ),
      ),
      TextFormField(
        controller: _confirmPassword,
        decoration: InputDecoration(
          label: Text("Enter confirm password"),
        ),
      ),
      ElevatedButton(onPressed: (){
        setState(() {
          sus = func(_employeeName.text,_mobile.text,_userName.text,_password.text,_confirmPassword.text);
        });
      }, child: Text("Save")),
    ],
    );
  }
  FutureBuilder addmessage()
  {
    return FutureBuilder(
        future: sus,
        builder: (BuildContext context, snapshot)
    {
      if(snapshot.hasData)
        {
          return Text("added successfully");
        }
      else if(snapshot.hasError)
        {
          return Text("error");
        }
      return CircularProgressIndicator();
    });
  }
}
