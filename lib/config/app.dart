import 'package:flutter/material.dart';
import 'package:tuupai/ui/shares/colors.dart';
import 'package:tuupai/ui/shares/fonts.dart';
import 'package:tuupai/ui/views/home_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tuupai',
      theme: ThemeData(
        fontFamily: notoSansKrFont,
        scaffoldBackgroundColor: backgroundColor
      ),
      home: HomeView(),
    );
  }
}