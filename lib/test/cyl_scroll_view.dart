
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CYLScrollView extends StatefulWidget {
  @override
  _CYLScrollViewState createState() => _CYLScrollViewState();
}

class _CYLScrollViewState extends State<CYLScrollView> {

  ItemScrollController itemScrollController = ItemScrollController();
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scroll positioned list'),),
      body: ScrollablePositionedList.builder(
          itemCount: 100,
          itemScrollController: itemScrollController,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              'data - $index', style: TextStyle(fontSize: index.toDouble()),);
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          index += 1;
          itemScrollController.scrollTo(
              index: index * 30, duration: Duration(milliseconds: 500));
        });
      }),
    );
  }
}
