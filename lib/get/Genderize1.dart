import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Genderize.dart';

class Genderize1 extends StatefulWidget {
  const Genderize1({super.key});

  @override
  State<Genderize1> createState() => _Genderize1State();
}

class _Genderize1State extends State<Genderize1> {
  
  Future<Genderize> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
    return Genderize.fromJson(jsonDecode(result.body));
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
                    Text(snapshot.data!.count.toString()),
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.gender.toString()),
                    Text(snapshot.data!.probability.toString()),
                  ],
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
