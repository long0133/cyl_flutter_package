import 'package:cyl_flutter_package/check_widget.dart';
import 'package:flutter/material.dart';
import 'package:cyl_flutter_package/cyl_progress.dart';
import 'package:cyl_flutter_package/cyl_switch_pages/cyl_switch_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: CYLSwitchPage(
          titles: ['aaaa','bbbb','cccc'],
          children: <Widget>[
            Container(
              color: Colors.purpleAccent,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.purple,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
