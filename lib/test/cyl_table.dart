import 'dart:math';

import 'package:cyl_flutter_package/xml_widgets/cyl_xml_table_parse.dart';
import './spannable_grid.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as XML;

class CYLTable extends StatefulWidget {
  final String xmlStr;

  CYLTable(this.xmlStr);

  @override
  _CYLTableState createState() => _CYLTableState();
}

class _CYLTableState extends State<CYLTable> {

  int rows;
  int columns;
  XmlTableParseResult result;

  @override
  void initState() {
    XmlTableParse parse = XmlTableParse();
    XML.XmlDocument xmlDocument = XML.parse(widget.xmlStr);
    parse.parse(xmlDocument).then((XmlTableParseResult result){
      this.result = result;
      rows = result.totalRow;
      columns = result.totalCol;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: result != null ? SpannableGrid(
          cells: _getCellss(),
          columns: 6,
          rows: 86) : Container(color: Colors.purple,),
    );
  }

  List<SpannableGridCellData> _getCellss() {
    List<SpannableGridCellData> result = List();
    result.add(SpannableGridCellData(
      column: 1,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "Test Cell 1",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: Text("Tile 1x2",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Test Cell 2",
      child: Container(
        color: Colors.limeAccent,
        child: Center(
          child: Text("Tile 2x1",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 4,
      row: 1,
      columnSpan: 1,
      rowSpan: 1,
      id: "Test Cell 3",
      child: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text("Tile 1x1",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 5,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Test Cell 4",
      child: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text("Tile 2x1",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 1,
      row: 3,
      columnSpan: 1,
      rowSpan: 1,
      id: "Test Cell 5",
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Text("Tile 1x1",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));
    return result;
  }

  List<SpannableGridCellData> _getCells() {
    List<SpannableGridCellData> cells = [];
    int id = 0;
    int row = 0;
    int col = 0;
    if(result != null) {
      result.trs.forEach((CYLTableRow tr) {
        tr.tds.forEach((CYLTableDataCell td) {
          id += 1;
          SpannableGridCellData cell = SpannableGridCellData(
              id: id,
              column: col,
              row: row,
              columnSpan: td.colSpan,
              rowSpan: td.rowSpan
          );
          cells.add(cell);
          col += 1;
        });
        row += 1;
      });
    }else{
      cells.add(SpannableGridCellData(id: id, column: 0, row: 0));
    }
    return cells;
  }
}
