import 'package:flutter/material.dart';
import 'package:toko_online/cart_screen.dart';
import 'package:toko_online/main_screen.dart';
import 'package:toko_online/detail_screen.dart';
import 'package:toko_online/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(child: child),
      title: "Toko Online XE",
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent[400],
        accentColor: Colors.white,
        fontFamily: 'NunitoRegular',
        disabledColor: Colors.grey,
        buttonColor: Colors.deepPurpleAccent[400],
      ),
      home: HomeScreen(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new HomeScreen(),
        '/detail' : (BuildContext context) => new DetailScreen(),
        '/cart' : (BuildContext context) => new CartScreen()
      },
    );
  }
}




