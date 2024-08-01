import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/photo_api.dart';
import 'package:rest_api/post_api.dart';
import 'package:rest_api/provider/count_provider.dart';
import 'package:rest_api/provider/favorute_provider.dart';
import 'package:rest_api/screens/county_example.dart';
import 'package:rest_api/screens/favorute_screen.dart';
import 'package:rest_api/screens/slider.dart';
import 'package:rest_api/screens/statemanagment.dart';
import 'package:rest_api/screens/value_notify_listner.dart';
import 'package:rest_api/signup.dart';
import 'package:rest_api/users_api.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => FavoruteProvider()),
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PostApi(),
      ),);
  }
}