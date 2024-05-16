import 'dart:convert';

import 'package:api/fakestore/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class user1 extends StatefulWidget {
  const user1({super.key});

  @override
  State<user1> createState() => _user1State();
}

class _user1State extends State<user1> {

  Future<Data> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.storerestapi.com/products/running-sneaker"));
    return Data.fromJson(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetch(),
              builder: (BuildContext context, snapshot)
              {
                if(snapshot.hasData)
                {
                  return Column(
                    children: [
                      Text(snapshot.data!.role.toString()),
                      Text(snapshot.data!.sId.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.email.toString()),
                      Text(snapshot.data!.password.toString()),
                      Text(snapshot.data!.createdAt.toString()),
                      Text(snapshot.data!.updatedAt.toString()),
                      Text(snapshot.data!.lastLoginAt.toString()),
                    ],
                  );
                }
                else if(snapshot.hasError)
                {
                  return Text("error");
                }
                return CircularProgressIndicator();
              })
        ],
      ),

    );
  }
}
