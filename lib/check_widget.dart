import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';


class CYLCheckWidget extends StatefulWidget {

  final String data;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Color lineColor;

  CYLCheckWidget(this.data, {
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
    this.lineColor = Colors.black
  });

  @override
  _CYLCheckWidgetState createState() => _CYLCheckWidgetState();
}

class _CYLCheckWidgetState extends State<CYLCheckWidget> with SingleTickerProviderStateMixin{

  TextPainter _textPainter;
  double diameter; //园的半径
  double strokeWidth = 0;
  double get spacing{
    return diameter/2.0;
  }

  Offset lineEndPoint;
  double percent = 0; // 动画完成的百分比
  double completePercent = 0.5; //动画完成比例为此值时,算完成此次操作动画
  double accelerator = 1.5;
  double completeWidth = 0; //手势滑动最长路径宽度
  Offset startOffSet = Offset.zero;
  bool swapToDisappear = false; //轻扫文本是否消失
  bool dragBegin = false;
  bool dragEnd = false;
  bool _isForwarding = true;
  bool animationComplete = false;

  double viaWidth = 0;
  bool changeDirection = false;

  //animation
  Duration animDuration = Duration(milliseconds: 300);
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: animDuration, vsync: this);
    _controller.addStatusListener((AnimationStatus status){

      if (status == AnimationStatus.forward){
        animationComplete = false;
      }else if (status == AnimationStatus.reverse){
        animationComplete = false;
      }else if (status == AnimationStatus.completed){
        animationComplete = true;
      }else if (status == AnimationStatus.dismissed){
        animationComplete = true;
      }
    });
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)..addListener((){
      setState(() {

      });
    });

    super.initState();
  }

  void prepare(){
    int colorAlpha = 255;
    colorAlpha = swapToDisappear ?
    (255*(1-toAnimationGetPercent())).toInt() :
    (255*((1-toAnimationGetPercent())<0.5?0.5:(1-toAnimationGetPercent()))).toInt();

    TextSpan span = TextSpan(
        text: widget.data,
        style: TextStyle(
            color: widget.color.withAlpha(colorAlpha),
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            fontStyle: widget.fontStyle
        ));
    _textPainter = TextPainter(
        text: span,
        textAlign: widget.textAlign,
        textDirection: TextDirection.ltr
    );
    _textPainter.layout();
    strokeWidth = widget.fontSize / 10 * 2;
  }

  @override
  Widget build(BuildContext context) {

    prepare();
    diameter = _textPainter.height;
    double width = _textPainter.width + widget.padding.horizontal + diameter + spacing;
    double height = _textPainter.height + widget.padding.vertical;
    lineEndPoint = Offset(width - widget.padding.horizontal/2.0 - 5, diameter/2.0);
    completeWidth = width / 2;

    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){

        if(details.localPosition.dx < width){
          viaWidth += details.delta.dx;

          if(viaWidth == 0){
            changeDirection = true;
          }

          if(changeDirection) return;

          setState(() {

            if(viaWidth > 0){
              //forward
              _isForwarding = true;
              double delta = details.localPosition.dx - startOffSet.dx;
              this.percent = delta / completeWidth;

            }else{
              //cancel
              _isForwarding = false;
              double delta = details.localPosition.dx - startOffSet.dx;
              if(delta > 0){
                this.percent = delta/completeWidth;
              }else{
                if(this.percent != 0){
                  this.percent = (1 - delta.abs() / completeWidth);
                }
              }
            }

            this.percent = this.percent >= 1 ? 1 : this.percent;
            this.percent = this.percent <= 0 ? 0 : this.percent;

          });
        }
      },


      onPanEnd: (DragEndDetails details){
        this.dragBegin = false;
        this.dragEnd = true;

        if(_isForwarding && this.percent >= completePercent){
          _controller.forward(from: this.percent);
        }else{
          _controller.reverse(from: this.percent);
        }
      },

      onPanStart: (DragStartDetails details){
        this.dragBegin = true;
        this.dragEnd = false;
        this.startOffSet = details.localPosition;
        viaWidth = 0;
        changeDirection = false;
      },
      child: Container(
        color: Colors.grey,
        width: width,
        height: height,
        padding: widget.padding,
        child: CustomPaint(
          painter: CYLCheckPainter(widget,this),
        ),
      ),
    );
  }

  double toAnimationGetPercent(){
    double percent = this.percent;
    if (dragEnd){
      percent = animation.value;
    }
    print('percent: $percent');
    return percent;
  }
}


class CYLCheckPainter extends CustomPainter {

  CYLCheckWidget widget;
  _CYLCheckWidgetState state;
  double startAngle = pi * 2;
  double deltaAngle = pi/4;
  Offset _circleCenter = Offset.zero;

  Offset get lineStartPoint {
    return Offset(
        state.diameter/2.0 * tan(pi/2 - startAngle),
        state.diameter * tan(startAngle)
    );
  }

  Paint _paint = Paint();
  Path _circlePath = Path();

  CYLCheckPainter(this.widget, this.state){
    _paint = Paint()
      ..color = widget.lineColor
        ..strokeWidth = state.strokeWidth
        ..style = PaintingStyle.stroke
        ..isAntiAlias = true
        ..strokeCap = StrokeCap.round;
  }


  @override
  void paint(Canvas canvas, Size size) {
    //text paint
    _drawText(canvas, size);

    //circle paint
    _circleCenter = Offset(
        state.diameter/2,
        size.height/2.0
    );
    _circlePath.reset();

    double stAngle = startAngle * (1 - state.toAnimationGetPercent());
    double swAngle = deltaAngle - pi*2 * (1 - state.toAnimationGetPercent());

    _circlePath.addArc(
        Rect.fromCenter(
            center: _circleCenter,
            width: state.diameter,
            height: state.diameter
        ),
        stAngle,
        swAngle
    );

//    Offset controlPoint = Offset(_circleCenter.dx + (state.diameter/10.0) * 6, (_circleCenter.dy / 10) * 10);
//    Offset toPoint = Offset(controlPoint.dx + state.diameter/2.0, controlPoint.dy);
//
//    _circlePath.conicTo(controlPoint.dx, controlPoint.dy, toPoint.dx, toPoint.dy, 1);
//    _circlePath.lineTo(
//        state.toAnimationGetPercent() <= 0 ? lineStartPoint.dx : toPoint.dx + (state.lineEndPoint.dx - toPoint.dx)*state.toAnimationGetPercent(),
//        state.lineEndPoint.dy
//    );

//    _linePath.reset();
//    _linePath.moveTo(
//        lineStartPoint.dx,
//        lineStartPoint.dy
//    );
//
//    _linePath.lineTo(
//        state.toAnimationGetPercent() <= 0 ? lineStartPoint.dx : lineStartPoint.dx + (state.lineEndPoint.dx - lineStartPoint.dx)*state.toAnimationGetPercent(),
//        state.lineEndPoint.dy
//    );

    canvas.drawPath(_circlePath, _paint);
//    canvas.drawPath(_linePath, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }

  void _drawText(Canvas canvas, Size size){

    double dx = (size.width - state._textPainter.size.width) / 2.0 + state.spacing;
    double dy = (size.height - state._textPainter.size.height) / 2.0;

    state._textPainter.paint(
        canvas,
        Offset(
            state.dragEnd ? dx : dx * (1 + state.toAnimationGetPercent() / 10.0),
            dy
        )
    );
  }
  
}