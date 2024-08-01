import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/PhotoModel.dart';
class PhotoApi extends StatefulWidget {
  const PhotoApi({super.key});

  @override
  State<PhotoApi> createState() => _PhotoApiState();
}

class _PhotoApiState extends State<PhotoApi> {
  List photoList=[];
  Future getPhotoApi()async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for(var i in data)
      {
        photoList.add(PhotoModel.fromJson(i) );
      }
      return photoList;
    }
    return photoList;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoApi'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body:  Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPhotoApi(),
              builder: (context, snapshot) {

                   if(snapshot.hasData)
                     {
                       return ListView.builder(
                         itemCount: photoList.length,
                         itemBuilder: (context, index) {
                           return  Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Card(
                                 child: ListTile(
                                   
                                   trailing: Text(index.toString()),
                                  
                                  leading : CircleAvatar(
                                     backgroundImage: NetworkImage(photoList[index].url),
                                   ),
                                   title:Text(photoList[index].title) ,
                                 ),
                               ),
                             ],
                           );
                         },
                       );
                     }
                   else{
                     return Center(child: CircularProgressIndicator());
                   }

              },
            ),
          )
        ],
      ),
    );
  }
}
