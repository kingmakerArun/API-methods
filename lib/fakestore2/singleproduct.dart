import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Single.dart';

class singleproduct extends StatefulWidget {
  final int? id;
  const singleproduct({super.key, this.id});

  @override
  State<singleproduct> createState() => _singleproductState();
}

class _singleproductState extends State<singleproduct> {

  Future<single> fetch() async
  {
    print(widget.id);
    var result = await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    return single.fromJson(jsonDecode(result.body));
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(snapshot.data!.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                        ),
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: Image.network(snapshot.data!.image.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data!.description.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data!.category.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                        ),
                      ],
                    ),
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
