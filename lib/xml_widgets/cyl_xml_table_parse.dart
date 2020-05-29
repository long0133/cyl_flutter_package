import 'package:cyl_flutter_package/xml_widgets/xml_test.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:cyl_flutter_package/extension/text_extension.dart';

//elem
const String tHead = 'thead';
const String tBody = 'tbody';
const String tR = 'tr';
const String tD = 'td';

//attr
const String colSpan = 'colspan';
const String rowSpan = 'rowspan';
const String vAlign = 'valign';

class XmlTableParseResult extends Object{
  String thead;
  List<CYLTableRow> trs =[];
  int totalCol = 0;
  int totalRow = 0;
  
}

class XmlTableParse extends Object{
  
  XmlTableParseResult result;

  Future<XmlTableParseResult> parse(XmlDocument xmlDocument) async {
    result = XmlTableParseResult();
    _parseTable(xmlDocument.root);
    return result;
  }

  void _parseTable(XmlNode node) {
    node.descendants.whereType<XmlElement>().forEach((XmlElement elem){
      switch(elem.name.toString()){
        case 'table':
          break;
        case tHead:
          result.thead = elem.text;
          break;
        case tBody:
          break;
        case tR:
          _parseTableRow(elem);
          break;
      }
    });

    //计算总行列数
    result.totalRow = result.trs.length;
    result.trs.first.tds.forEach((CYLTableDataCell td){
      result.totalCol += td.colSpan;
    });

    //调整数据为标准数据,因跨行跨列空出的列表用空对象占位
    normalizedTableData();
  }

  void normalizedTableData() {
    for (int row = 0; row < result.totalRow; row ++) {
      CYLTableRow tr = result.trs[row];
      for (int col = 0; col < tr.tds.length; col++) {
//        CYLTableDataCell td = tr.tds[col];
        //根据上一行本列的rowspan,调整本行行数
        int lastRow = row - 1;
        if(lastRow >= 0){
          CYLTableRow lastTr = result.trs[lastRow];
          CYLTableDataCell lastTdByCol = lastTr.tds[realIndexByTotalCol(lastTr, col)];
          if(lastTdByCol.rowSpan > 1){
            insertZeroTdToCol(tr, col, 1,rowSpan: lastTdByCol.rowSpan-1,colSpan: 1);
          }
        }
      }
    }
  }

  //结合当前行的 col 计算本 td 对应上一行哪个 td
  int realIndexByTotalCol(CYLTableRow tr, int totalColSpan){

    for(int col = 0; col < tr.tds.length; col++){
      totalColSpan -= tr.tds[col].colSpan;
      if(totalColSpan < 0) return col;
    }
    return -1;
  }

  //插入空对象 空对象的 colspan,rowspan 可设置
  void insertZeroTdToCol(CYLTableRow tr, int insertAt, int insertNum, {int colSpan, int rowSpan}){
    for(int i = 0; i < insertNum; i++){
      tr.tds.insert(insertAt, CYLTableDataCell.zero(colSpan: colSpan,rowSpan: rowSpan));
    }
  }


  void _parseTableRow(XmlElement elem){
    CYLTableRow tableRow = CYLTableRow();
    result.trs.add(tableRow);
    if(elem.children.length != 0){
      elem.descendants.whereType<XmlElement>().forEach((XmlElement subElem){
        //处理 td 标签
        if(subElem.name.toString() == tD){
          XmlElement td = subElem;
          CYLTableDataCell tdCell = CYLTableDataCell(colSpan: 1, rowSpan: 1, valign: '1', text: '');
          tableRow.totalCol += 1;
          tableRow.tds.add(tdCell);
          //获取 td 内容
          if(td.text != null && td.text.length != 0){
            tdCell.text = td.text.trim();
          }
          //分配 td 属性
          td.attributes.forEach((XmlAttribute attr){
            if(attr.name.toString() == colSpan){
              tdCell.colSpan = int.parse(attr.value);
              tableRow.totalCol -= 1;
              tableRow.totalCol += tdCell.colSpan;
            }else if(attr.name.toString() == rowSpan){
              tdCell.rowSpan = int.parse(attr.value);
            }else if(attr.name.toString() == vAlign){
              tdCell.valign = attr.value;
            }
          });
        }
      });
    }
  }
}

class CYLTableRow extends Object{
  List<CYLTableDataCell> tds = [];
  int totalCol = 0;

  @override
  String toString() {
    return '''<tr>\n
    ${tds.map((CYLTableDataCell td){
      return td.toString() + '\n';
    }).toList()}
    </tr>\n''';
  }
}

class CYLTableDataCell extends Object{
  int colSpan;
  int rowSpan;
  String valign;
  String text;
  bool isPlaceHolder;

  CYLTableDataCell({
    this.colSpan,
    this.rowSpan,
    this.text,
    this.valign,
    this.isPlaceHolder = false
});

  factory CYLTableDataCell.zero({int colSpan = 1,int rowSpan = 1}){
    return CYLTableDataCell(isPlaceHolder: true, colSpan: colSpan,rowSpan: rowSpan,text: '',valign: '1');
  }

  @override
  String toString() {
    return '<td colspan:$colSpan rowspan:$rowSpan valign:$valign>$text</td> -- ${this.isPlaceHolder}';
  }
}