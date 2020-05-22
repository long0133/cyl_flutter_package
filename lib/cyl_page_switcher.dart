import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CYLPageSwitcher extends StatefulWidget {

  final List<String> titles;
  final Color titleColor;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final double horizontalSpacing;
  final double verticalSpacing;
  final Color selectColor;
  final double cornerRadius;
  final int initSelectIndex;
  final Color color;

  CYLPageSwitcher({
    @required this.titles,
    this.color,
    this.titleColor = Colors.black,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.horizontalSpacing = 0,
    this.verticalSpacing = 0,
    this.selectColor = Colors.purpleAccent,
    this.cornerRadius = 5,
    this.initSelectIndex = 0,
  });

  @override
  _CYLPageSwitcherState createState() => _CYLPageSwitcherState();
}

class _CYLPageSwitcherState extends State<CYLPageSwitcher> {

  List<TextPainter> textPainters = [];
  List<Rect> hitTestRectList = [];
  double width = 0;
  double height = 0;
  int selectIndex = 0;

  @override
  void initState() {
    selectIndex = widget.initSelectIndex;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    width += ((widget.titles.length - 1) + 1) * widget.horizontalSpacing * 2;
    height += widget.verticalSpacing * 2;
    calculateTextWidth();
    calculateHitTestRect();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){

      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius))
        ),
        width: width,
        height: height,
        child: CustomPaint(
          painter: CYLPageSwitcherPainter(
            this,widget,
            clickCallBack: (int index){
              setState(() {

              });
            }
          ),
        ),
      ),
    );
  }

  void calculateTextWidth(){
    double maxHeight = 0;
    widget.titles.forEach((String title){
      TextSpan span = TextSpan(
          text: title,
          style: TextStyle(
              color: widget.titleColor,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              fontStyle: widget.fontStyle
          ));

      TextPainter textPainter = TextPainter(
          text: span,
          textAlign: widget.textAlign,
          textDirection: TextDirection.ltr
      );

      textPainter.layout();
      width += textPainter.size.width;
      if(maxHeight <= textPainter.size.height){
        maxHeight = textPainter.size.height;
      }

      textPainters.add(textPainter);
    });
    height += maxHeight;
  }

  void calculateHitTestRect(){
    double from = 0;
    double lastTo = 0;
    for(int i = 0; i < widget.titles.length; i++){
      if(i == 0){
        from = lastTo;
        lastTo = textPainters[i].size.width + widget.horizontalSpacing * 2;
      }else{
        from = lastTo;
        lastTo = from + textPainters[i].size.width + widget.horizontalSpacing * 2;
      }

      double hitWidth = 0;
      hitWidth = textPainters[i].size.width + widget.horizontalSpacing * 2;

      Rect rect = Rect.fromLTWH(from, 0, hitWidth, height);
      hitTestRectList.add(rect);
    }
  }
}

typedef ClickCallBack = void Function(int);
class CYLPageSwitcherPainter extends CustomPainter{

  _CYLPageSwitcherState _state;
  CYLPageSwitcher _widget;
  Path bgPath;
  Paint bgPaint;
  ClickCallBack clickCallBack;

  CYLPageSwitcherPainter(this._state, this._widget, {this.clickCallBack}) {
    bgPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = _widget.selectColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    
    bgPath = Path();
    int selectIndex = _state.selectIndex;
    bgPath.addRRect(RRect.fromLTRBR(
        _state.hitTestRectList[selectIndex].left,
        _state.hitTestRectList[selectIndex].top,
        _state.hitTestRectList[selectIndex].right,
        _state.hitTestRectList[selectIndex].height,
        Radius.circular(_widget.cornerRadius
        )));
    canvas.drawPath(bgPath, bgPaint);
    _drawText(canvas, size);
  }

  @override
  bool hitTest(Offset position) {
    int count = 0;
    _state.hitTestRectList.forEach((Rect rect){
      if(rect.contains(position)){
        _state.selectIndex = count;
      }
      count += 1;
    });

    if(clickCallBack != null) clickCallBack(_state.selectIndex);
    return super.hitTest(position);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawText(Canvas canvas, Size size){

    double count = 0;
    double dx = 0;
    double lastTextWidth = 0;
    _state.textPainters.forEach((TextPainter painter){
      dx += count == 0 ? _widget.horizontalSpacing : _widget.horizontalSpacing * 2 + lastTextWidth;
      painter.paint(
        canvas,
        Offset(dx, _widget.verticalSpacing)
      );
      count += 1;
      lastTextWidth = painter.size.width;
    });
  }
}


