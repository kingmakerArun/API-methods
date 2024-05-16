import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'IPify.dart';

class IPify1 extends StatefulWidget {
  const IPify1({super.key});

  @override
  State<IPify1> createState() => _IPify1State();
}

class _IPify1State extends State<IPify1> {

Future<IPify> fetch() async
{
  var result = await http.get(Uri.parse("https://api.ipify.org?format=json"));
  return IPify.fromJson(jsonDecode(result.body));
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
    Text(snapshot.data!.ip.toString()),
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
