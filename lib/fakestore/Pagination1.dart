import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Pagination.dart';

class Pagination1 extends StatefulWidget {
  const Pagination1({super.key});

  @override
  State<Pagination1> createState() => _Pagination1State();
}

class _Pagination1State extends State<Pagination1> {

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
                      Text(snapshot.data!.image.toString()),
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
