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
      result.totalCol += int.parse(td.colSpan);
    });
  }

  void _parseTableRow(XmlElement elem){
    CYLTableRow tableRow = CYLTableRow();
    result.trs.add(tableRow);
    if(elem.children.length != 0){
      elem.descendants.whereType<XmlElement>().forEach((XmlElement subElem){
        //处理 td 标签
        if(subElem.name.toString() == tD){
          XmlElement td = subElem;
          CYLTableDataCell tdCell = CYLTableDataCell(colSpan: '1', rowSpan: '1', valign: '1', text: '');
          tableRow.tds.add(tdCell);
          //获取 td 内容
          if(td.text != null && td.text.length != 0){
            tdCell.text = td.text.trim();
          }
          //分配 td 属性
          td.attributes.forEach((XmlAttribute attr){
            if(attr.name.toString() == colSpan){
              tdCell.colSpan = attr.value;
            }else if(attr.name.toString() == rowSpan){
              tdCell.rowSpan = attr.value;
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
  String colSpan;
  String rowSpan;
  String valign;
  String text;

  CYLTableDataCell({
    this.colSpan,
    this.rowSpan,
    this.text,
    this.valign
});

  @override
  String toString() {
    return '<td colspan:$colSpan rowspan:$rowSpan valign:$valign>$text</td>';
  }
}