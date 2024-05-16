// import 'dart:convert';
//
// import 'package:api/fakestore2/storees.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class store extends StatefulWidget {
//   const store({super.key});
//
//   @override
//   State<store> createState() => _storeState();
// }
//
// class _storeState extends State<store> {
//
//   Future<List<ProductsApi>> fetch() async
//   {
//     var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     var data = jsonDecode(res.body);
//     print(data);
//     // return (data as List).map((obj) => ProductsApi.fromJson(obj)).toList();
//     return (data as List).map((obj) => ProductsApi.fromJson(obj)).toList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//          FutureBuilder(
//              future: fetch(),
//              builder: (BuildContext context, snapshot){
//                print("ughb");
//                if(snapshot.hasData){
//                  print("ughb");
//                  List<ProductsApi> list = snapshot.data!;
//                  print(list.toString() + "  list1");
//                  return Container(
//                    height: 800,
//                    child: ListView.builder(
//                      itemCount: list.length,
//                        itemBuilder: (context, int index){
//                          return ListTile(
//                            title: Text(list[index].category.toString()),
//                          );
//                        }
//                    ),
//                  );
//                } else if (snapshot.hasError){
//                  return Text("error");
//                } return CircularProgressIndicator();
//              }
//          )
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:api/fakestore2/storees.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class sample123 extends StatefulWidget {
  const sample123({super.key});

  @override
  State<sample123> createState() => _sample123State();
}

class _sample123State extends State<sample123> {
  
  Future<List<Products>> fetchdata() async {
    var res = await http.get(
      Uri.parse("https://fakestoreapi.com/products")
    );
    var data = jsonDecode(res.body);
    return (data as List).map((e) => Products.fromJson(e)).toList();
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
                  List<Products> list1 = snapshot.data!;
                  return Container(
                    height: 900,
                    child: ListView.builder(
                        itemBuilder: (context, int index){
                          return Column(
                            children: [
                              Text(list1[index].category.toString())
                            ],
                          );
                        }
                    ),
                  );
                } else if (snapshot.hasError){
                  return Text("error");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}


