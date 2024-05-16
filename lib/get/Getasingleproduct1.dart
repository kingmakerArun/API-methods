import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Getasingleproduct.dart';
class Getasingleproduct1 extends StatefulWidget {
  const Getasingleproduct1({super.key});

  @override
  State<Getasingleproduct1> createState() => _Getasingleproduct1State();
}

class _Getasingleproduct1State extends State<Getasingleproduct1> {

  Future<Getasingleproduct> fetch() async
  {
    var result = await http.get(Uri.parse("https://fakestoreapi.com/products/1"));
    return Getasingleproduct.fromJson(jsonDecode(result.body));
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
                        Text(snapshot.data!.title.toString()),
                        Text(snapshot.data!.price.toString()),
                        Text(snapshot.data!.description.toString()),
                        Text(snapshot.data!.category.toString()),
                        Text(snapshot.data!.image.toString()),
                        Text(snapshot.data!.rating.toString()),
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
