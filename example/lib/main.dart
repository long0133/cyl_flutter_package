import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:HomePage(),

      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  Future<void> initPlatformState() async {
    if (!mounted) return;
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Column(
        children: <Widget>[
          Text('Running on'),
          FlatButton(
            child: Text('Tap'),
            onPressed:(){
            } ,
          )
        ],
      ),
    );
  }
}
