import 'package:flutter/material.dart';

import '';
import 'Views/Screens/HomePage.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/':(context) => HomePage(),
    },
  ));
}