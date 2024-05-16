import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:api/fakestore2/singleproduct.dart';
import 'package:api/fakestore2/storees.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../get/Dogs1.dart';
import '../get/coin.dart';

class storees1 extends StatefulWidget {
  const storees1({super.key});

  @override
  State<storees1> createState() => _storees1State();
}

class _storees1State extends State<storees1> {

  Future<List<Products>> fetch() async
  {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(res.body);
    //print(data);
    return (data as List).map((obj) => Products.fromJson(obj)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home_filled),
          onPressed: ()
          { setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> coind()));
          }); },
        ),
        title: Center(child: Text("Shopify Card", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Dogs1()));
            });
          }, child: Text("Login")),
        ],
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            FutureBuilder(
                future: fetch(),
                builder: (BuildContext context, snapshot)
                {
                  if(snapshot.hasData)
                  {
                    List<Products> list = snapshot.data!;
                    print(list);
                    return
                    Container(
                      height: 900,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context,int index)
                      {
                       return
                         GestureDetector(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) =>  singleproduct(id:list[index].id)),
                             );
                           },
                           child:
                           Card(
                             elevation: 12,
                             child: ListTile(
                               title: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Container(
                                     height: 150,
                                     width: double.infinity,
                                     child: Image.network(list[index].image.toString()),
                                   ),
                                   SizedBox(height: 10,),
                                   Center(child: Text(list[index].category.toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent))),
                                   SizedBox(height: 10,),
                                   Text(list[index].title.toString(),style:TextStyle(fontStyle: FontStyle.italic,color: Colors.blue),overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: false,),
                                   Text(list[index].description.toString(),style:TextStyle(fontStyle: FontStyle.italic),overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: false,),
                                   SizedBox(height: 10,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text("₹",style:TextStyle(fontStyle: FontStyle.italic)),
                                       Text(list[index].price.toString(),style:TextStyle(fontStyle: FontStyle.italic),overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: false,),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ) ;
                      }),
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
      ),

    );
  }
}

