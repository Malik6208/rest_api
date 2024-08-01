import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
class CountyExample extends StatefulWidget {
  const CountyExample({super.key});

  @override
  State<CountyExample> createState() => _CountyExampleState();
}

class _CountyExampleState extends State<CountyExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(const Duration(seconds: 1),(v)
    {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {

    print('Build');
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer <CountProvider>(builder: (context, value, child) {
              print('Only this widget build');
              return Text(value.count.toString()
                ,style: const TextStyle(fontSize: 25),);
      } )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.setCount();
      },
        child: const Icon(Icons.add),
      ),
    );

  }
}
