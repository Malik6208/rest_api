import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var emailController=TextEditingController();
  var passlController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Malik'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                controller:emailController ,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(12),
                  ),
                  hintText: 'email'

                ),
              ),
                  ),
            const SizedBox(height: 15,),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller:passlController ,
                decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(12),
                    ),
                    hintText: 'password'

                ),
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: 300,
              child: ElevatedButton(onPressed: (){
               login(emailController.text.toString(),passlController.text.toString());
              },
               child: Text('Submit'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
          ],
        ),
      ),

    );
  }
  login(String email,password)async{
    try{
      Response response=await post(
          Uri.parse('https://reqres.in/api/rejister'),
        body: {
            'email':email,
          'password':password,
        }
      );
      if(response.statusCode==200)
        {
          print('Acount Created sucsessfully');
        }
      else{
        print('failed');
      }
    }
    catch (e)
    {
      print(e.toString());
    }
    
  }
}
