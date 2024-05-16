import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DataUSA.dart';

class DataUSA1 extends StatefulWidget {
  const DataUSA1({super.key});

  @override
  State<DataUSA1> createState() => _DataUSA1State();
}

class _DataUSA1State extends State<DataUSA1> {

Future<DataUSA> fetch() async
{
  var result = await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
  return DataUSA.fromJson(jsonDecode(result.body));
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
                return Column
                  (
                  children: [
                    Text(snapshot.data!.data.toString()),
                    Text(snapshot.data!.source.toString()),
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
