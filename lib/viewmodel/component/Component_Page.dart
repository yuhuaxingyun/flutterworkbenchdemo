import 'package:flutter/material.dart';
import 'package:flutterworkbench/viewmodel/Gesture/Gesture_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Progress_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Radio_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Text_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Buttoon_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Slider_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Swith_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Image_Page.dart';
import 'package:flutterworkbench/viewmodel/layout/RowAndColumn.dart';
import 'package:flutterworkbench/viewmodel/layout/Stack_Page.dart';
import 'package:flutterworkbench/viewmodel/layout/Wrap_Page.dart';
import 'package:flutterworkbench/viewmodel/layout/Flow_Page.dart';
import 'package:flutterworkbench/viewmodel/layout/Me_Page.dart';
import 'package:flutterworkbench/viewmodel/layout/FlowPopMenu_Page.dart';
import 'package:flutterworkbench/viewmodel/decoration/Container_Page.dart';
import 'package:flutterworkbench/viewmodel/decoration/Flexible_Page.dart';
import 'package:flutterworkbench/viewmodel/Gesture/Gesture_Page.dart';
import 'package:flutterworkbench/viewmodel/Gesture/InkWell_Page.dart';


class ComponentPage extends StatefulWidget{
  @override
  State<ComponentPage> createState() => _ComponentState();
}

class _ComponentState extends State<ComponentPage> {
  @override
  List<String> titleItems = <String>[
    "Text",
    "Button",
    "Radio",
    "Slider",
    "Switch",
    "Progress",
    "Image",
    "RowAndColumn",
    "Stack",
    "Wrap",
    "Flow",
    "Me",
    "FlowPopMenu",
    "Container、SizedBox、AspectRatio 和 FractionallySizedBox",
    "Expanded、Flexible 和 Spacer ",
    "Gesture",
    "InkWell、Ink",
  ];

  Widget buildListData(BuildContext context, String titleItem) {
    return new ListTile(
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 20, color: Colors.black),
        textAlign: TextAlign.start,
      ),
      onTap: () {
        _enter(titleItems.indexOf(titleItem));
      },
    );
  }

  void _enter(int index) {
    String title = titleItems[index];
    print("click item = $index, $title");
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>TextPage()
        ));
        break;
      case 1:
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ButtonPage()
      ));
      break;
      case 2:
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>RadioPage()
      ));
      break;
      case 3:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SliderPage()
        ));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SwitchPage()
        ));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ProgressPage(title)
        ));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ImagePage(title)
        ));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>RowAndColumnPage()
        ));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>StackPage()
        ));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>WrapPage()
        ));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>FlowPage()
        ));
        break;
      case 11:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>MePage()
        ));
        break;
      case 12:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>FlowPopMenuPage()
        ));
        break;
      case 13:
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ContainerPage()
      ));
      break;
      case 14:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>FlexiblePage()
        ));
        break;
      case 15:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>GesturePage()
        ));
        break;
      case 16:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>InkWellPage()
        ));
        break;


    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('基本组件'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return buildListData(context, titleItems[index]);
          },
          separatorBuilder: (context, index) => new Divider(),
          itemCount: titleItems.length,
      ),
    );
  }

}