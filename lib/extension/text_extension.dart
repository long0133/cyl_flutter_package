import 'package:flutter/material.dart';

extension TextSize on Text{

  Size size(){
    TextSpan span = TextSpan(
        text: this.data,
        style: TextStyle(
            color: this.style.color,
            fontSize: this.style.fontSize,
            fontWeight: this.style.fontWeight,
            fontStyle: this.style.fontStyle
        ));
    TextPainter textPainter = TextPainter(
        text: span,
        textAlign: this.textAlign,
        textDirection: TextDirection.ltr
    );
    textPainter.layout();
    return textPainter.size;
  }
}