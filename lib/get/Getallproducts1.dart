// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Getallproducts.dart';
//
// class Getallproducts1 extends StatefulWidget {
//   const Getallproducts1({super.key});
//
//   @override
//   State<Getallproducts1> createState() => _Getallproducts1State();
// }
//
// class _Getallproducts1State extends State<Getallproducts1> {
//
//   Future<List<Getallproducts>> fetch() async
//   {
//     var result = await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     var d = jsonDecode(result.body)[];
//     // return Getallproducts.fromJson(jsonDecode(result.body).toList());
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           FutureBuilder(
//               future: fetch(),
//               builder: (BuildContext context, snapshot)
//               {
//                 if(snapshot.hasData)
//                 {
//                   return Column
//                     (
//                     children: [
//                     //  Text(snapshot.data!.title[index].toString()),
//                       Text(snapshot.data!.title.toString()),
//                       Text(snapshot.data!.price.toString()),
//                       Text(snapshot.data!.description.toString()),
//                       Text(snapshot.data!.category.toString()),
//                       Text(snapshot.data!.image.toString()),
//                       Text(snapshot.data!.rating.toString()),
//                     ],
//                   );
//                 }
//                 else if(snapshot.hasError)
//                 {
//                   return Text("${snapshot.error}");
//                 }
//                 return CircularProgressIndicator();
//               })
//         ],
//       ),
//     );
//   }
// }
