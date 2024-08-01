import 'package:flutter/material.dart';
class SSlider extends StatefulWidget {
  const SSlider({super.key});

  @override
  State<SSlider> createState() => _SSliderState();
}

class _SSliderState extends State<SSlider> {

  @override
  Widget build(BuildContext context) {
    double value=1.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            min: 0,
            max: 100,

            value: value,
            onChanged: (val) {
               value=val;
               setState(() {

               });
          },),
          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 100,

                  color: Colors.green.withOpacity(value),
                  child: const Center(child: Text('Container1')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,

                  color: Colors.red.withOpacity(value),
                  child: const Center(child: Text('Container1')),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
