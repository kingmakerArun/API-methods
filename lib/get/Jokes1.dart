import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Jokes.dart';

class Jokes1 extends StatefulWidget {
  const Jokes1({super.key});

  @override
  State<Jokes1> createState() => _Jokes1State();
}

class _Jokes1State extends State<Jokes1> {

  Future<Jokes> fetch() async
  {
    var result = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return Jokes.fromJson(jsonDecode(result.body));
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
                  return
                    Column(
                      children: [
                        Text(snapshot.data!.type.toString()),
                        Text(snapshot.data!.setup.toString()),
                        Text(snapshot.data!.punchline.toString()),
                        Text(snapshot.data!.id.toString()),
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
