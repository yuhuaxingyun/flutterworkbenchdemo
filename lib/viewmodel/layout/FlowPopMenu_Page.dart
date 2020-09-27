import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class FlowPopMenuPage extends StatefulWidget{
  @override
  State<FlowPopMenuPage> createState() => _FlowPopMenuState();
}

class _FlowPopMenuState extends State<FlowPopMenuPage> with SingleTickerProviderStateMixin{
  // 动画必须要 SingleTickerProviderStateMixin 类
  AnimationController _ctrlAnimationPopMenu; //定义动画的变量
  IconData lastTapped = Icons.notifications;

  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState(){
    super.initState();
    _ctrlAnimationPopMenu = AnimationController(
      duration: const Duration(milliseconds: 250), // 动画时长250毫秒
      vsync: this,
    );
  }

  //生产 Popmenu 数据
  Widget flowMenuItem(IconData icon){
    final double buttonDiameter = MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: (){
          _updateMenu(icon);
        },
        child: Icon(icon,color: Colors.white,size: 30,),
      ),
    );
  }

  void _updateMenu(IconData icon){
    if (icon != Icons.menu){
      setState(() {
        lastTapped = icon;
      });
    }else{
      /// 展开和收起
      _ctrlAnimationPopMenu.status == AnimationStatus.completed
          ? _ctrlAnimationPopMenu.reverse() : _ctrlAnimationPopMenu.forward();
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FlowPopMenu'),
      ),
      body: Center(
        child: Flow(
          delegate: FlowMenuDelegate(animation: _ctrlAnimationPopMenu), 
            children: menuItems.map((IconData icon) => flowMenuItem(icon)).toList(),
        ),

      ),
    );
  }
}

/// MARK: FlowMenuDelegate
class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 50.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; ++i) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}