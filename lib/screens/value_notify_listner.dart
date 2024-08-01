import 'package:flutter/material.dart';
class ValueNotifyListner extends StatefulWidget {
   ValueNotifyListner({super.key});

  @override
  State<ValueNotifyListner> createState() => _ValueNotifyListnerState();
}

class _ValueNotifyListnerState extends State<ValueNotifyListner> {
   ValueNotifier<bool> toggle=ValueNotifier(false);
   @override
   void dispose()
   {
    super.dispose();
     toggle.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           ValueListenableBuilder(
               valueListenable: toggle, builder: (context, value, child) {
                 return  SizedBox(
                   width: 300,
                   child: TextFormField(
                     obscureText: toggle.value,
                     decoration: InputDecoration(
                         suffixIcon: InkWell(
                           onTap: (){
                             toggle.value=!toggle.value;
                           },
                             child: Icon(toggle.value?Icons.visibility_off_outlined:Icons.visibility)),
                         hintText: 'password',
                         enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                     ),
                   ),
                 );
               },
           )
        ],
      ),
    );
  }
}
