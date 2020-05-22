import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CYLProgressType { line, circle }

typedef ProgressBuilder = double Function(int index);
typedef ColorBuilder = Color Function(int index);

class CYLProgress extends StatefulWidget {
  final CYLProgressType type;
  final ProgressBuilder progressBuilder;
  final ColorBuilder colorBuilder;
  final int progressCount;
  final double cornerRadius;
  final Color borderColor;
  final bool animate;

  CYLProgress(
      {@required this.type,
      @required this.progressBuilder,
      @required this.colorBuilder,
      @required this.progressCount,
      this.cornerRadius = 10,
      this.borderColor,
      this.animate = false});

  factory CYLProgress.singleCircle(double percent, Color color,{double width = 10, Color borderColor, bool animate}) {
    return CYLProgress(
        type: CYLProgressType.circle,
        progressBuilder: (index) {
          return percent;
        },
        colorBuilder: (index) {
          return color;
        },
        progressCount: 1,
      cornerRadius: width,
      animate: animate,
    );
  }

  factory CYLProgress.singleLine(double percent, Color color,{double width = 10, Color borderColor, bool animate}){
    return CYLProgress(
      type: CYLProgressType.line,
      progressBuilder: (index) {
        return percent;
      },
      colorBuilder: (index) {
        return color;
      },
      progressCount: 1,
      cornerRadius: width,
      animate: animate,
    );
  }

  @override
  _CYLProgressState createState() => _CYLProgressState();
}

class _CYLProgressState extends State<CYLProgress> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CYLProgressPainter(this),
      ),
    );
  }
}

class CYLProgressPainter extends CustomPainter {
  _CYLProgressState _state;
  Paint _paint;
  Paint _borderPaint;
  Paint _circleLayerPaint;
  Paint _circlePathPaint;
  double borderStrokeWidth = 0;
  double circleWidth = 0;
  Color defaultBackGroundColor = Color.fromARGB(255, 225, 225, 225);

  CYLProgressPainter(this._state) {
    print('$_state, ${_state.widget.cornerRadius}');
    borderStrokeWidth = _state.widget.cornerRadius / 4;
    circleWidth = borderStrokeWidth * 5;

    _paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    _borderPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = borderStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = _state.widget.borderColor ?? defaultBackGroundColor;

    _circleLayerPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = circleWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = _state.widget.borderColor ?? defaultBackGroundColor;

    _circlePathPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = circleWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = _state.widget.borderColor ?? Colors.green;
  }

  @override
  void paint(Canvas canvas, Size size) {
    switch (_state.widget.type) {
      case CYLProgressType.line:
        drawLineProgress(canvas, size);
        break;
      case CYLProgressType.circle:
        drawCircleProgress(canvas, size);
        break;
      default:
        break;
    }
  }

  void drawLineProgress(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    //绘制边框 path
    Path borderPath = Path();
    double pathHeight = 20;
    double top = height / 2.0 - pathHeight / 2.0;
    borderPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, top, width, pathHeight),
        Radius.circular(_state.widget.cornerRadius)));
    canvas.drawPath(borderPath, _borderPaint);

    //绘制线条 path
    List<Path> paths = [];
    double left = borderStrokeWidth / 2.0;
    for (int i = 0; i < _state.widget.progressCount; i++) {
      Path path = Path();
      double percent = _state.widget.progressBuilder(i);
      percent = percent > 1.0 ? 1 : percent;
      percent = percent < 0.0 ? 0 : percent;
      double lineWidth = (size.width - borderStrokeWidth) * percent;
      double lineHeight = pathHeight - borderStrokeWidth;
      double lineTop = top + borderStrokeWidth / 2;
      double radius = _state.widget.cornerRadius;

      if (i == 0) {
        //第一个
        path.addRRect(RRect.fromRectAndCorners(
            Rect.fromLTWH(left, lineTop, lineWidth, lineHeight),
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius)));
      } else if (i == _state.widget.progressCount - 1) {
        //最后一个
        path.addRRect(RRect.fromRectAndCorners(
            Rect.fromLTWH(left, lineTop, lineWidth, lineHeight),
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius)));
      } else {
        //中间的
        path.addRRect(RRect.fromRectAndCorners(
            Rect.fromLTWH(left, lineTop, lineWidth, lineHeight),
            topLeft: Radius.zero));
      }

      left = left + lineWidth;
      paths.add(path);
    }

    int count = 0;
    paths.forEach((Path path) {
      _paint = _paint..color = _state.widget.colorBuilder(count);
      canvas.drawPath(path, _paint);
      count += 1;
    });
  }

  void drawCircleProgress(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double diameter = min(width, height) - (circleWidth * 2);
    //绘制底板
    Path circleLayerPath = Path();
    Offset center = Offset(width / 2.0, height / 2.0);
    circleLayerPath.addArc(
        Rect.fromCenter(center: center, width: diameter, height: diameter),
        0,
        pi * 2);
    canvas.drawPath(circleLayerPath, _circleLayerPaint);

    //绘制环形进度条
    List<Path> paths = [];
    double angle = 0;
    for (int i = 0; i < _state.widget.progressCount; i++) {
      Path path = Path();
      double percent = _state.widget.progressBuilder(i);
      double sweepAngle = pi * 2 * percent;
      path.addArc(
          Rect.fromCenter(center: center, width: diameter, height: diameter),
          angle,
          sweepAngle);
      angle += sweepAngle;
      paths.add(path);
    }

    int count = 0;
    if (paths.length > 1) {
      _circlePathPaint.strokeCap = StrokeCap.square;
    }

    paths.forEach((Path path) {
      _circlePathPaint.color = _state.widget.colorBuilder(count);
      canvas.drawPath(path, _circlePathPaint);
      count += 1;
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
