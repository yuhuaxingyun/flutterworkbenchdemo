import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class FlowPage extends StatefulWidget{
  @override
  State<FlowPage> createState() => _FlowState();
}

class _FlowState extends State<FlowPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: ToolsUtil.screenWidth,
        height: 400,
        child: Flow(
          delegate: SimpleFlowDelegate(),
          children: List.generate(4, (index){
            return Container(
              height: 50,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
        ),
      ),
    );
  }
}

/// MARK: -  FlowDelegate
class  SimpleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i=0;i<context.childCount;++i){
      context.paintChild(i,transform: Matrix4.translationValues(10.0*i, 30.0*i, 0));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;

  }
}