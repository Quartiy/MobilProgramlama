import 'package:flutter/material.dart';
import 'package:muhammet_vizeodev/girisekrani.dart';
import 'package:muhammet_vizeodev/uyeol.dart';
import 'package:muhammet_vizeodev/sifremiunuttum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
      '/': (context) => girisekrani(),
      '/uyeol': (context) => uyeol(),
      '/sifremiunuttum': (context) => sifremiunuttum(),
      },

      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Bir şeyler ters gitti'),
            ),
          )),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
    );
  }
}
