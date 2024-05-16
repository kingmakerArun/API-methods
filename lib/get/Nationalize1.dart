import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Nationalize.dart';

class Nationalize1 extends StatefulWidget {
  const Nationalize1({super.key});

  @override
  State<Nationalize1> createState() => _Nationalize1State();
}

class _Nationalize1State extends State<Nationalize1> {
  
  Future<Nationalize> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    return Nationalize.fromJson(jsonDecode(result.body));

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
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.data!.count.toString()),
                      Text(snapshot.data!.name.toString()),
                      // Text(snapshot.data!.country.toString()),
                    ],
                  ),
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
