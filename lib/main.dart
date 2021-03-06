import 'package:flutter/material.dart';
import 'package:pardemo/pages/detail_page.dart';
import 'package:pardemo/pages/hom_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Hom_Page(),
      routes: {
        Hom_Page.id:(context)=>Hom_Page(),
        Detail_Page.id:(context)=>Detail_Page(),
      },
    );
  }
}

