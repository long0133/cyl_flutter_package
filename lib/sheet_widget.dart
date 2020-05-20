import 'package:cyl_flutter_package/sheet_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double dividerHeight = 7;
typedef DidClickItem = void Function(int index);

class SheetWidget extends StatefulWidget {

  final List<SheetWidgetItem> children;
  final BuildContext context;
  final double itemHeight;
  final double fontSize;
  final DidClickItem didClickItem;
  final String title;
  final String cancelTitle;
  final double titleFontSize;


  SheetWidget(
      this.context,
      this.fontSize,
      {this.children,
        this.itemHeight,
        this.didClickItem,
        this.title,
        this.titleFontSize,
        @required this.cancelTitle
      });

  void showSheet(){
//    showModalBottomSheet(context: context, builder: (context){
//      return this;
//    });
    Navigator.of(context).push(PopRouteTransparent(child: this, disposeHandler: (){
      SheetWidgetPublicState().callAction();
    }));
  }


  @override
  _SheetWidgetState createState() => _SheetWidgetState();
}

class _SheetWidgetState extends State<SheetWidget> with TickerProviderStateMixin {

 static const Color dividerColor = Color.fromRGBO(220, 220, 220, 0.5);
 AnimationController animController;
 Animation anim;
 SheetWidgetPublicState publicState;
 int itemCount = 0;
 SheetWidgetItem actSheetItem;

 @override
  void initState() {
   super.initState();
   publicState = new SheetWidgetPublicState();
   publicState.state = this;
   itemCount = widget.children.length + 1;
   if (widget.title != null) itemCount += 1;
   int height = (itemCount * widget.itemHeight + dividerHeight).toInt();
   animController = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
   anim = new Tween(begin: 0, end: height.toDouble()).animate(animController)..addListener((){
     setState(() {

     });
   });
   animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){
        SheetWidgetPublicState.instance.hideSheet(barrierDismiss: true);
        return Future.value(true);
      },
      child: MultiProvider(
        providers: [
          Provider<double>.value(value: widget.fontSize),
          Provider<int>.value(value: (widget.itemHeight).toInt()),
          Provider<SheetWidgetPublicState>.value(value: publicState)
        ],
        child: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: anim.value.toDouble(),
//              padding: EdgeInsets.only(bottom: ScreenUtil().setSp(15)),
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                itemBuilder: listItemBuild,
                itemCount: itemCount,
                separatorBuilder: separatedBuild,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listItemBuild(BuildContext context,int index){

   int i = index;
   if (widget.title != null) {//标题
     if (i == 0) {
       return SheetWidgetItem(widget.title, (){
       },textColor: Theme.of(context).primaryColor, canResponseTap: false, specificFontSize: widget.titleFontSize,);
     }
     i = i - 1;
   }

    if (i == widget.children.length) {//取消按钮
      return SheetWidgetItem(widget.cancelTitle ?? 'Cancel', (){
      },textColor: Theme.of(context).primaryColor, isCancel: true,);
    }

    return widget.children[i];
  }

  Widget separatedBuild(BuildContext context, int index){

    int i = index;
    if (widget.title != null) {
      if (i == 0) {
        return Divider(
          thickness: ScreenUtil().setSp(dividerHeight/2),
          height: ScreenUtil().setSp(dividerHeight/2),
          color: dividerColor,
        );
      }
      i = i - 1;
    }


    if (i == widget.children.length - 1){
      return Divider(
        thickness: ScreenUtil().setSp(dividerHeight),
        height: ScreenUtil().setSp(dividerHeight),
        color: dividerColor,
      );
    }

    return Divider(
      thickness: ScreenUtil().setSp(dividerHeight/2),
      height: ScreenUtil().setSp(dividerHeight/2),
      color: dividerColor,
      indent: ScreenUtil().setSp(15),
      endIndent: ScreenUtil().setSp(15),
    );
  }

  void hideSheet(bool barrierDismiss,SheetWidgetItem sheetItem){

    int height = (itemCount * widget.itemHeight + (itemCount - 1) * dividerHeight).toInt();
    actSheetItem = sheetItem;

    if(sheetItem != null && !sheetItem.canResponseTap){
      return;
    }
    animController.reverse(from: height.toDouble()).then((_){
    }).whenComplete((){
      if(!barrierDismiss) Navigator.of(context).pop(true);
    });
  }

 void callAction(){
   if (actSheetItem != null && actSheetItem.canResponseTap){
     Future.delayed(Duration(milliseconds: 100), (){
       actSheetItem.onTap();
     });
   }
 }

}

class SheetWidgetPublicState {

  _SheetWidgetState state;
  factory SheetWidgetPublicState() => _getInstance();
  static SheetWidgetPublicState get instance => _getInstance();
  static SheetWidgetPublicState _instance;
  static SheetWidgetPublicState _getInstance(){
    if(_instance == null){
      _instance = new SheetWidgetPublicState._internal();
    }
    return _instance;
  }

  SheetWidgetPublicState._internal();

  void hideSheet({bool barrierDismiss = false, SheetWidgetItem sheetItem}){
    if(state != null) {
      state.hideSheet(barrierDismiss,sheetItem);
    }
  }

  void callAction(){
    if (state != null){
      state.callAction();
    }
  }
}

typedef DisposeHandler = void Function();

class PopRouteTransparent extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 200);
  Widget child;
  DisposeHandler disposeHandler;

  PopRouteTransparent({@required this.child, this.disposeHandler});

  @override
  void dispose() {
    print('route dispose');
    if (disposeHandler != null){
      disposeHandler();
    }
    super.dispose();
  }

  @override
  Color get barrierColor => Color.fromRGBO(0, 0, 0, 0.4);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}


