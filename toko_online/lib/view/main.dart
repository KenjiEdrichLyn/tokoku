import 'package:flutter/material.dart';
import 'package:toko_online/view/cart_screen.dart';
import 'package:toko_online/view/main_screen.dart';
import 'package:toko_online/view/search_screen.dart';
import 'package:toko_online/resources/project_colors.dart';

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
        primaryColor: purple,
        accentColor: Colors.white,
        fontFamily: 'NunitoRegular',
        disabledColor: grey,
        buttonColor: purple,
      ),
      home: HomeScreen(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new HomeScreen(),
        '/search' : (BuildContext context) => new SearchScreen(),
        '/cart' : (BuildContext context) => new CartScreen()
      },
    );
  }
}




