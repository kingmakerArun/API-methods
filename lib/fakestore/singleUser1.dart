import 'dart:convert';


import 'package:api/fakestore/singleUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class singleUser1 extends StatefulWidget {
  const singleUser1({super.key});

  @override
  State<singleUser1> createState() => _singleUser1State();
}

class _singleUser1State extends State<singleUser1> {

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
