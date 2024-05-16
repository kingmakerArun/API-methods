import 'dart:convert';

import 'package:api/fakestore2/sortted.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Sortted1 extends StatefulWidget {
  const Sortted1({super.key});

  @override
  State<Sortted1> createState() => _Sortted1State();
}

class _Sortted1State extends State<Sortted1> {
  Future<List<Sort>> fetch() async
  {
    var result = await http.get(Uri.parse("https://fakestoreapi.com/products?sort=desc"));
    var data = jsonDecode(result.body);
    return (data as List).map((e) =>  Sort.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          FutureBuilder(
              future: fetch(), 
              builder: (BuildContext context, snapshot)
          {
            if(snapshot.hasData)
              {
                List a= snapshot.data!;
                return
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: a.length,
                        itemBuilder: (context, int index)
                    {
                      return ListTile(
                        title: Column(
                          children: [
                            Text(a[index].toString()),
                          ],
                        ),
                      );
                    }),
                  );
              }
            else if(snapshot.hasError)
              {
                return Text("error");
              }
          return CircularProgressIndicator();
          })
        ],
      ),
    );
  }
}
