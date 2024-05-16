import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'IPinfo.dart';



class IPinfo1 extends StatefulWidget {
  const IPinfo1({super.key});

  @override
  State<IPinfo1> createState() => _IPinfo1State();
}

class _IPinfo1State extends State<IPinfo1> {

  Future<IPinfo> fetch() async
  {
    var result = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    return IPinfo.fromJson(jsonDecode(result.body));
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
                  return
                    Column(
                      children: [
                        Text(snapshot.data!.ip.toString()),
                        Text(snapshot.data!.city.toString()),
                        Text(snapshot.data!.region.toString()),
                        Text(snapshot.data!.country.toString()),
                        Text(snapshot.data!.loc.toString()),
                        Text(snapshot.data!.org.toString()),
                        Text(snapshot.data!.postal.toString()),
                        Text(snapshot.data!.timezone.toString()),
                        Text(snapshot.data!.readme.toString()),
                      ],
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
