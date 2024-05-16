import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'RandomUser.dart';

class RandomUser1 extends StatefulWidget {
  const RandomUser1({super.key});

  @override
  State<RandomUser1> createState() => _RandomUser1State();
}

class _RandomUser1State extends State<RandomUser1> {

  Future<List<Results>> fetch() async
  {
    var result = await http.get(Uri.parse("https://randomuser.me/api/"));
    var d = jsonDecode(result.body)["results"];
    return (d as List).map((obj)=>Results.fromJson(obj)).toList();
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
                  List<Results> list = snapshot.data!;
                  return
                  Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount:list.length,
                        itemBuilder: (context, int index)
                    {
                      return ListTile(
                          title: Column(
                            children: [
                              Text(list[index].gender.toString()),
                              // Text(list[index].name.toString()),
                              // Text(list[index].location.toString()),
                              Text(list[index].email.toString()),
                              // Text(list[index].login.toString()),
                              // Text(list[index].dob.toString()),
                              // Text(list[index].registered.toString()),
                              Text(list[index].phone.toString()),
                              Text(list[index].cell.toString()),
                              // Text(list[index].id.toString()),
                              // Text(list[index].picture.toString()),
                              Text(list[index].nat.toString()),
                            ],
                          ),
                      );
                    }),
                  );
                }
                else if(snapshot.hasError)
                {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
