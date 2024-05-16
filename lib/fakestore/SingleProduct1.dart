import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'SingleProduct.dart';

class SingleProduct1 extends StatefulWidget {
  const SingleProduct1({super.key});

  @override
  State<SingleProduct1> createState() => _SingleProduct1State();
}

class _SingleProduct1State extends State<SingleProduct1> {

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
                      Text(snapshot.data!.sId.toString()),
                      Text(snapshot.data!.title.toString()),
                      Text(snapshot.data!.createdAt.toString()),
                      Text(snapshot.data!.updatedAt.toString()),
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
