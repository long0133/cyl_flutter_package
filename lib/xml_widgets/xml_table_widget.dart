import 'package:cyl_flutter_package/xml_widgets/cyl_xml_table_parse.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as XML;

class XMLTableWidget extends StatefulWidget {

  final String xmlStr;
  XMLTableWidget(this.xmlStr);

  @override
  _XMLTableWidgetState createState() => _XMLTableWidgetState();
}

class _XMLTableWidgetState extends State<XMLTableWidget> {
  XmlTableParseResult result;
  List<int> maxStringLengthPerCol;
  //绘制时,表格垂直线在 x 轴上的偏移,通过 colspan 的和即可知道绘制在 x 哪个点上
  List<int> vLineOffsetXUnit;

  @override
  void initState() {
    XmlTableParse parse = XmlTableParse();
    XML.XmlDocument xmlDocument = XML.parse(widget.xmlStr);
    parse.parse(xmlDocument).then((XmlTableParseResult result){
      this.result = result;
      //计算每列最大字符长度
      maxStringLengthPerCol = List(result.totalCol).map((i)=>0).toList();
      for(int row = 0; row < result.totalRow; row ++){
        CYLTableRow tableRow = result.trs[row];
        for(int col = 0; col < tableRow.tds.length; col++){
          int lastCol = col == 0 ? col : col - 1;
          CYLTableDataCell td = tableRow.tds[col];
          CYLTableDataCell lastTd = tableRow.tds[lastCol];
          if(maxStringLengthPerCol[col == 0 ? col : (int.parse(lastTd.colSpan) + lastCol)] < td.text.length){
            maxStringLengthPerCol[col] = td.text.length;
          }
        }
      }
      setState(() {
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CYLTablePainter(this),
      ),
    );
  }
}

class CYLTablePainter extends CustomPainter {
  _XMLTableWidgetState _state;
  Paint tablePaint;


  CYLTablePainter(this._state){
    tablePaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..color = Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int unitsNum = 0;
    _state.vLineOffsetXUnit = _state.maxStringLengthPerCol.map((i){
      unitsNum += i;
      return unitsNum;
    }).toList();

    double tableHeight = 30;
    double unitWidth = size.width / unitsNum.toDouble();
    double initHeight = 0;//横线距离顶部的距离

    //绘制横线
    Path hLinePath = Path()..moveTo(0, 0);
    Path vLinePath = Path()..moveTo(0, 0);

    for(int row = 0; row < _state.result.totalRow; row ++){
      CYLTableRow tr = _state.result.trs[row];
      int totalColSpan = 0;
      double offsetX = 0;
      for(int col = 0; col < tr.tds.length; col++){
//        int realIndex = min
        CYLTableDataCell td = tr.tds[col];
        if(col != 0){
          offsetX = _state.vLineOffsetXUnit[totalColSpan].toDouble() * unitWidth;
        }
        //垂直线
        vLinePath.reset();
        vLinePath.moveTo(offsetX, initHeight);
        vLinePath.lineTo(offsetX, initHeight + tableHeight);

        //水平线
        //当前
        hLinePath.reset();

        canvas.drawPath(vLinePath, tablePaint);
        canvas.drawPath(hLinePath, tablePaint);

        totalColSpan += int.parse(td.colSpan);
      }

      initHeight += tableHeight;
    }

//    vLinePath.reset();
//    vLinePath.moveTo(size.width, 0);
//    vLinePath.lineTo(size.width, size.height);
//    canvas.drawPath(vLinePath, tablePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
