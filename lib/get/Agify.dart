import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Ageif.dart';

class Agify1 extends StatefulWidget {
  const Agify1({super.key});

  @override
  State<Agify1> createState() => _Agify1State();
}

class _Agify1State extends State<Agify1> {
  
  Future<Agify> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
    return Agify.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
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
                      Text(snapshot.data!.age.toString()),
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
      ),
    );
  }
}
