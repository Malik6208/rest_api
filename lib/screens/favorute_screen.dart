import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorute_provider.dart';
class FavoruteScreen extends StatefulWidget {
  const FavoruteScreen({super.key});

  @override
  State<FavoruteScreen> createState() => _FavoruteScreenState();
}

class _FavoruteScreenState extends State<FavoruteScreen> {
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoruteScreen'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),

      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoruteProvider>(builder: (context, value, child) {
                    return ListTile(
                      onTap: (){
                        if(value.selectItem.contains(index))
                          {
                            value.removeItem(index);
                          }else
                            {
                              value.addItem(index);
                            }
                      },
                      leading: Text('Item$index'),
                      trailing: value.selectItem.contains(index)?
                      const Icon(Icons.favorite_outlined):
                      const Icon(Icons.favorite_border_outlined),
                    );
                  },);
                },
            ),
          )
        ],
      ),
    );
  }
}
