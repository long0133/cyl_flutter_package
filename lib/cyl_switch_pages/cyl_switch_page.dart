import 'package:cyl_flutter_package/cyl_switch_pages/cyl_page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CYLSwitchPage extends StatefulWidget {

  final List<Widget> children;
  final List<String> titles;
  final Color indicatorColor;

  CYLSwitchPage({
    @required this.children,
    @required this.titles,
    @required this.indicatorColor
});

  @override
  _CYLSwitchPageState createState() => _CYLSwitchPageState();
}

class _CYLSwitchPageState extends State<CYLSwitchPage> {

  PageController _pageController;
  int currentIndex;
  double scrollPercent = 0;

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
    scrollPercent = _pageController.offset % screenW / screenW;
    setState(() {
      currentIndex = _pageController.page.toInt();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: CYLPageSwitcher(
                titles: widget.titles,
                fontSize: 20,
                horizontalSpacing: 30,
                verticalSpacing: 3,
                titleColor: Colors.white,
                color: Colors.grey[500],
                currentIndex: currentIndex,
                selectColor: widget.indicatorColor,
                clickCallBack: (int index){
                  _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                },
                switchPercent: scrollPercent,
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
                physics: ScrollPhysics(parent: ClampingScrollPhysics()),
              ),
            ),
          )
        ],
      )
    );
  }
}
