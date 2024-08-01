import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class UsersApi extends StatefulWidget {
  const UsersApi({super.key});

  @override
  State<UsersApi> createState() => _UsersApiState();
}

class _UsersApiState extends State<UsersApi> {
  var data;
  Future getUserApi()async{
    var response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200)
      {
        data=jsonDecode(response.body.toString());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserApi'),
        centerTitle: true,
      ),
      body:  Column(

        children: [
         FutureBuilder(
           future: getUserApi(), builder: (context, snapshot) {
           if(snapshot.hasData)
             {
               return ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (context, index) {
                   var no=(index+1);
                 return  Card(
                   child: Column(
                     children: [
                       ListTile(
                         leading: Text(no.toString()),
                         title: Text(data[index]['name'].toString()),
                         subtitle: Text(data[index]['username'].toString()),

                       )
                     ],
                   ),
                 );
               },);
             }else
               {
                 return const Center(child: CircularProgressIndicator());
               }
           
         },)

        ],
      ),
    );
  }
}




