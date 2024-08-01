import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  login(String email,password)
 async {
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/register'),
        body: {
        'email':email,
          'password':password,
        },
      );
      if(response.statusCode==200)
        {
          var data=jsonDecode(response.body.toString());
          print(data['token']);
          print('Account created Successfully');
        }else{
        print('Failed');

      }

    }catch(e){
      print(e.toString());
    }
  }
  var emailController=TextEditingController();
  var passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostApi'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: emailController,
                decoration:InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
              )
                ),
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: 300,
              child: TextField(
                controller: passController,
                decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              login(emailController.text.toString(), passController.text.toString());
            }, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
