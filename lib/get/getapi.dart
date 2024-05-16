import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modal.dart';
class ob extends StatefulWidget {
  const ob({super.key});

  @override
  State<ob> createState() => _obState();
}

class _obState extends State<ob> {
  
  Future<Catfact> fetch() async {
    var result = await http.get(
      Uri.parse("https://catfact.ninja/fact")
    );
    
    return Catfact.fromJson(jsonDecode(result.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetch(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.fact.toString()),
                      Text(snapshot.data!.length.toString()),
                    ],
                  );
                } else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
