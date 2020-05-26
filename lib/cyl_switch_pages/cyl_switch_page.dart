import 'package:cyl_flutter_package/cyl_switch_pages/cyl_page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CYLSwitchPage extends StatefulWidget {

  final List<Widget> children;
  final List<String> titles;

  CYLSwitchPage({
    @required this.children,
    @required this.titles
});

  @override
  _CYLSwitchPageState createState() => _CYLSwitchPageState();
}

class _CYLSwitchPageState extends State<CYLSwitchPage> {

  PageController _pageController;
  int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    _pageController = PageController()..addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(pageListener);
    super.dispose();
  }

  void pageListener(){

    double screenW = MediaQuery.of(context).size.width;
    double percent = _pageController.offset % screenW / screenW;

    setState(() {
      if(percent == 0) currentIndex = _pageController.page.toInt();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: CYLPageSwitcher(
                titles: widget.titles,
                fontSize: 20,
                horizontalSpacing: 20,
                verticalSpacing: 10,
                titleColor: Colors.white,
                color: Colors.grey[500],
                currentIndex: currentIndex,
                clickCallBack: (int index){
                  _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                },
              ),
            ),
          ),

          Expanded(
            flex: 9,
            child: Container(
              color: Colors.amber,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: widget.children,
              ),
            ),
          )
        ],
      )
    );
  }
}
