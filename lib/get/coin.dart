import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'm.dart';

class coind extends StatefulWidget {
  const coind({super.key});

  @override
  State<coind> createState() => _coindState();
}

class _coindState extends State<coind> {
  
  Future<CoinDesk> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    return CoinDesk.fromJson(jsonDecode(result.body));
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
                return Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      // Text(snapshot.data!.time.toString()),
                      SizedBox(height: 30,),
                      Text(snapshot.data!.disclaimer.toString()),
                    ],
                  ),
                );
              }
            else if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }return CircularProgressIndicator();
          }

          )
        ],
      ),
    );
  }
}
