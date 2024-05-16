import 'package:api/post/Clientinsert1.dart';
import 'package:api/post/Employeeinsert1.dart';
import 'package:api/post/post1.dart';
import 'package:flutter/material.dart';

import 'fakestore/singleUser1.dart';
import 'fakestore/store1.dart';
import 'fakestore/user1.dart';
import 'fakestore2/Sortted1.dart';
import 'fakestore2/singleproduct.dart';
import 'fakestore2/store.dart';
import 'fakestore2/storees1.dart';
import 'get/Agify.dart';
import 'get/DataUSA1.dart';
import 'get/Dogs1.dart';
import 'get/Genderize1.dart';
import 'get/Getallproducts1.dart';
import 'get/IPify1.dart';
import 'get/IPinfo1.dart';
import 'get/Jokes1.dart';
import 'get/Nationalize1.dart';
import 'get/RandomUser1.dart';
import 'get/UniversitiesList1.dart';
import 'get/Zippopotam1.dart';
import 'get/coin.dart';
import 'get/getapi.dart';
import 'getlist/getlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:UniversitiesList1(),
    );
  }
}