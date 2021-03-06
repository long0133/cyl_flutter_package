import 'package:cyl_flutter_package/check_widget.dart';
import 'package:cyl_flutter_package/xml_widgets/xml_test.dart';
import 'package:flutter/material.dart';
import 'package:cyl_flutter_package/xml_widgets/cyl_xml_table_parse.dart';
import 'package:cyl_flutter_package/xml_widgets/xml_table_widget.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Container(
          child: CYLSwitchPage(children: [Container(),Container(),Container()], titles: ['aaaaa','bbbb','ccc'], indicatorColor: Colors.orangeAccent),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
