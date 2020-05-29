import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef ClickCallBack = void Function(int);

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
  final int currentIndex;
  final Color color;
  final ClickCallBack clickCallBack;
  final double switchPercent;

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
    this.currentIndex = 0,
    this.clickCallBack,
    this.switchPercent,
  });

  @override
  _CYLPageSwitcherState createState() => _CYLPageSwitcherState();
}

typedef StateClickCallBack = void Function(int,Rect);
class _CYLPageSwitcherState extends State<CYLPageSwitcher> with TickerProviderStateMixin{

  List<TextPainter> textPainters = [];
  List<Rect> hitTestRectList = [];
  double width = 0;
  double height = 0;
  //点击选中的 index
  int hitToSelectIndex = 0;
  int lastSelect = 0;
  //点击触发的动画是否开始
  bool hitAnimTriggered = false;
  Animation leftAnim;
  AnimationController _leftAnimController;
  Animation rightAnim;
  AnimationController _rightAnimController;
  Duration _animDuration = Duration(milliseconds: 400);

  double lastPercent = 0;
  //页面是前进还是后退
  bool isForward = true;

  @override
  void initState() {
    hitToSelectIndex = widget.currentIndex % widget.titles.length;
    width += ((widget.titles.length - 1) + 1) * widget.horizontalSpacing * 2;
    height += widget.verticalSpacing * 2;
    calculateTextWidth();
    calculateHitTestRect();
    //初始动画值
    _leftAnimController = AnimationController(duration: _animDuration, vsync: this);
    _rightAnimController = AnimationController(duration:  _animDuration, vsync: this);
    leftAnim = Tween(begin: hitTestRectList.first.left, end: hitTestRectList.last.left).animate(_leftAnimController);
    rightAnim = Tween(begin: hitTestRectList.first.right, end: hitTestRectList.last.right).animate(_rightAnimController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isForward = widget.switchPercent - lastPercent > 0;
    lastPercent = widget.switchPercent;

    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius))
      ),
      width: width,
      height: height,
      child: CustomPaint(
        painter: CYLPageSwitcherPainter(
            this,widget,
            clickCallBack: clickCallBack
        ),
      ),
    );
  }

  void clickCallBack(int index, Rect rect){
    setState(() {
      hitToSelectIndex = index;
      doAnimation();
      if(widget.clickCallBack != null) widget.clickCallBack(index);
    });
  }

  void doAnimation(){
//    print('${widget.currentIndex}---$selectIndex');
    Rect toRect = hitTestRectList[hitToSelectIndex];
    Rect fromRect = hitTestRectList[widget.currentIndex];
    _leftAnimController.reset();
    _rightAnimController.reset();
    leftAnim = Tween(begin: fromRect.left, end: toRect.left).animate(_leftAnimController);
    rightAnim = Tween(begin: fromRect.right, end: toRect.right).animate(_rightAnimController)..addStatusListener((status){
      //点击后动画结束时,设置 hit 为 false
      if(status == AnimationStatus.completed) {
        hitAnimTriggered = false;
      }
    });
    _leftAnimController.forward();
    _rightAnimController.forward();
//    print('${fromRect.toString()}, ${toRect.toString()}');
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


class CYLPageSwitcherPainter extends CustomPainter{

  _CYLPageSwitcherState _state;
  CYLPageSwitcher _widget;
  Path bgPath;
  Paint bgPaint;
  StateClickCallBack clickCallBack;

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

//    print('${_state.leftAnim.value} -- ${_state.rightAnim.value}');
    bgPath = Path();
    int selectIndex = _state.hitToSelectIndex;
    int nextIndex = _widget.currentIndex;
    if(_state.isForward){
      nextIndex = nextIndex == _state.hitTestRectList.length - 1 ? nextIndex : nextIndex + 1;
    }else{
      nextIndex = nextIndex == 0 ? 0 : nextIndex - 1;
    }
//    nextIndex = nextIndex < 0 ? 0 : nextIndex;
//    print('next:$nextIndex -- ${_widget.switchPercent} -- ${_state.isForward}');

    double left =  _state.hitTestRectList[selectIndex].left;
    double right =  _state.hitTestRectList[selectIndex].right;
    double top =  _state.hitTestRectList[selectIndex].top;
    double bottom =  _state.hitTestRectList[selectIndex].bottom;

    if(_state.hitAnimTriggered){
      left = _state.leftAnim.value;
      right = _state.rightAnim.value;
    }else{

    }

    print('sel: $selectIndex, next:$nextIndex, percent:${_widget.switchPercent}');

    bgPath.addRRect(RRect.fromLTRBR(
        left,
        top,
        right,
        bottom,
        Radius.circular(_widget.cornerRadius
        )));
    canvas.drawPath(bgPath, bgPaint);
    _drawText(canvas, size);
  }

  @override
  bool hitTest(Offset position) {
    if(_widget.switchPercent != 0) return false;
    int count = 0;
    _state.hitAnimTriggered = true;
    Rect theRect = Rect.zero;
    _state.hitTestRectList.forEach((Rect rect){
      if(rect.contains(position)){
        theRect = rect;
        _state.hitToSelectIndex = count;
      }
      count += 1;
    });
    print('${_state.hitToSelectIndex}');
    if(clickCallBack != null) clickCallBack(_state.hitToSelectIndex,theRect);
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


