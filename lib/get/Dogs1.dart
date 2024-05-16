import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Dogs.dart';

class Dogs1 extends StatefulWidget {
  const Dogs1({super.key});

  @override
  State<Dogs1> createState() => _Dogs1State();
}

class _Dogs1State extends State<Dogs1> {
  
  Future<Dogs> fetch() async
  {
    var result = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    return Dogs.fromJson(jsonDecode(result.body));
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
            print(snapshot.hasData);
           if(snapshot.hasData)
             {
               return Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(
                   children: [
                     // Text(snapshot.data!.message.toString()),

                     Text(snapshot.data!.status.toString()),
                     Container(
                       height: 300,
                       width: 350,
                       child: Image.network(snapshot.data!.message.toString()),

                     ),
                   ],
                 ),
               );
             }
           else if(snapshot.hasError)
             {
               return Text("");
             }
           return CircularProgressIndicator();
          })
          
        ],
      ),
    );
  }
}
