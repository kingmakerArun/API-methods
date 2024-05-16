import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UniversitiesList.dart';

class UniversitiesList1 extends StatefulWidget {
  const UniversitiesList1({super.key});

  @override
  State<UniversitiesList1> createState() => _UniversitiesList1State();
}

class _UniversitiesList1State extends State<UniversitiesList1> {

  Future<List<UniversitiesList>> fetchdata() async {
    var res = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States"));
    var data = jsonDecode(res.body)["domains"];
    return (data as List).map((obj) => UniversitiesList.fromJson(obj)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetchdata(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  List<UniversitiesList> list = snapshot.data!;
                  return
                    Container(
                      height: 800,
                      child: ListView.builder(
                          itemCount:list.length ,
                          itemBuilder: (context, int index){
                            return ListTile(
                              title: Column(
                                children: [
                                  Text(list[index].webPages.toString()),
                                  // Text(list[index].alphaTwoCode.toString()),
                                  // Text(list[index].stateProvince.toString()),
                                  // Text(list[index].domains.toString()),
                                  // Text(list[index].name.toString()),
                                  // Text(list[index].country.toString()),
                                ],
                              ),
                            );
                          }
                      ),
                    );
                } else if(snapshot.hasError){
                  return Text("error");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
