import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/PostModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List postList=[];
  getApi()async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
   // var data= response.body.toString();
    if(response.statusCode==200)
      {
        for(var i in data)
          {
            postList.add(PostModel.fromJson(i));
          }
        return postList;
      }else
        {
         return postList;
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getApi(),
                builder: (context, snapshot) {
                              if(snapshot.hasData)
                                {
                                  return  ListView.builder(
                                    itemCount: postList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Card(
                                            elevation: 8,
                                            child: ListTile(
                                              leading: Text(postList[index].id.toString()),
                                              title: Text(postList[index].title),
                                              trailing:Text(postList[index].userId.toString()) ,
                                            ),
                                          ),
                                        ],
                                      );
                                    },);
                                }else{
                                return const Center(child: CircularProgressIndicator());
                              }




            
                },),
          )
        ],
      )
    );
  }
}
