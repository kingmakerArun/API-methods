import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Zippopotam.dart';
import 'Zippopotam.dart';


class Zippopotam1 extends StatefulWidget {
  const Zippopotam1({super.key});

  @override
  State<Zippopotam1> createState() => _Zippopotam1State();
}

class _Zippopotam1State extends State<Zippopotam1> {

  Future<List<Places>> fetch() async
  {
    var result = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    var data = jsonDecode(result.body)["places"];
    return (data as List).map((e) => Places.fromJson(e)).toList();
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
                  List<Places> a=snapshot.data!;
                  return Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: a.length,
                        itemBuilder: (context,int index)
                    {
                      return ListTile(
                        title: Column(
                          children: [
                            Text(a[index].placeName.toString()),
                            Text(a[index].longitude.toString()),
                            Text(a[index].state.toString()),
                            Text(a[index].stateAbbreviation.toString()),
                            Text(a[index].latitude.toString()),
                          ],
                        ),
                      );
                    }),
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
