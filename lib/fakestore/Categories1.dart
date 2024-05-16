import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Categories.dart';

class Categories1 extends StatefulWidget {
  const Categories1({super.key});

  @override
  State<Categories1> createState() => _Categories1State();
}

class _Categories1State extends State<Categories1> {

  Future<Data> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.storerestapi.com/products/running-sneaker"));
    return Data.fromJson(jsonDecode(result.body));
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
                      Text(snapshot.data!.products.toString()),
                      Text(snapshot.data!.sId.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.slug.toString()),
                    ],
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
