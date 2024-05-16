import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Clientinsert1 extends StatefulWidget {
  const Clientinsert1({super.key});

  @override
  State<Clientinsert1> createState() => _Clientinsert1State();
}

class _Clientinsert1State extends State<Clientinsert1> {

  TextEditingController _clientName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _gst = TextEditingController();
  TextEditingController _website = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contactPerson = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  Future<bool>? _successful;

  Future<bool> fun(String clientName, String phone,String address,
                      String gst, String website,String email,
                          String contactPerson,String phoneNumber) async
  {
    var result = await http.post
      (Uri.parse("http://catodotest.elevadosoftwares.com/Client/InsertClient"),
    headers: <String , String>
        {
          'Content-Type' : 'application/json; charset=utf-8'
    },
    body:jsonEncode(<String,dynamic>
    {
      "clientId":0,
      "clientName":clientName,
      "phone":phone,
      "address":address,
      "gst":gst,
      "website":website,
      "email":email,
      "contactPerson":contactPerson,
      "phoneNumber":phoneNumber,
      "createdBy":1
    })
    );
    return jsonDecode(result.body)["success"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (_successful == null ? addedlist() : messagedetail()),
          )
        ],
      ),
    );
  }
  Column addedlist()
  {
    return Column(
      children: [
        TextFormField(
          controller: _clientName,
          decoration: InputDecoration(
            label: Text("Enter the Client name"),
          ),
        ),
        TextFormField(
          controller: _phone,
          decoration: InputDecoration(
            label: Text("Enter the phone"),
          ),
        ),
        TextFormField(
          controller: _address,
          decoration: InputDecoration(
            label: Text("Enter the address"),
          ),
        ),
        TextFormField(
          controller: _gst,
          decoration: InputDecoration(
            label: Text("Enter the gst"),
          ),
        ),
        TextFormField(
          controller: _website,
          decoration: InputDecoration(
            label: Text("Enter the website"),
          ),
        ),
        TextFormField(
          controller: _email,
          decoration: InputDecoration(
            label: Text("Enter the email"),
          ),
        ),
        TextFormField(
          controller: _contactPerson,
          decoration: InputDecoration(
            label: Text("Enter the contact person"),
          ),
        ),
        TextFormField(
          controller: _phoneNumber,
          decoration: InputDecoration(
            label: Text("Enter the phone number"),
          ),
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            _successful=fun(_clientName.text,_phone.text,_address.text,_gst.text,
            _website.text,_email.text,_contactPerson.text,_phoneNumber.text);
          });
        }, child: Text("Save")),
      ],
    );
  }
  FutureBuilder messagedetail()
    {
    return FutureBuilder(
        future: _successful,
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
    }
    );
  }
}
