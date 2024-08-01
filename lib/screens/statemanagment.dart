import 'dart:async';

import 'package:flutter/material.dart';
class Statemanagment extends StatefulWidget {
  const Statemanagment({super.key});

  @override
  State<Statemanagment> createState() => _StatemanagmentState();
}

class _StatemanagmentState extends State<Statemanagment> {
  int c=0;
  var time=DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic( Duration(microseconds: 1),(time)
    {
      setState(() {
c++;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
  //  var time=DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statemangment'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(c.toString(),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
          );
  }
}
