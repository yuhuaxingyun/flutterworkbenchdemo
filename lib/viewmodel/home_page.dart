import 'package:flutter/material.dart';
import 'package:flutterworkbench/viewmodel/video_player.dart';
import 'package:flutterworkbench/viewmodel/Network_Page.dart';
import 'package:flutterworkbench/viewmodel/WebView_page.dart';
import 'package:flutterworkbench/viewmodel/Share_Page.dart';
import 'package:flutterworkbench/viewmodel/ScanCode_Page.dart';
import 'package:flutterworkbench/viewmodel/Banner_Page.dart';
import 'package:flutterworkbench/viewmodel/LocalWebView_Page.dart';
import 'package:flutterworkbench/viewmodel/BaseWidget_Page.dart';
import 'package:flutterworkbench/viewmodel/Map_Page.dart';
import 'package:flutterworkbench/viewmodel/component/Component_Page.dart';
import 'package:flutterworkbench/model/homemodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  // 数据源
  List<String> titleItems = <String>[
    "播放器",
    "网络请求",
    "WebView",
    "分享",
    "扫码",
    "Banner",
    "本地远程WebView",
    "基础控件",
    "Map调用",
    "基本组件"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initList();
  }
  void initList() {
    for (int i = 0; i < 5; i++) {
      homemodel model = new homemodel("title $i");
      model.title = titleItems[i];
    }
  }

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

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(context, titleItems[i]));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Workbench",
        )
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return buildListData(context, titleItems[index]);
          },
          separatorBuilder: (context, index) => new Divider(),
          itemCount: titleItems.length
      ),
    );
  }

  void _enter(int index) {
    String title = titleItems[index];
    print("click item = $index, $title");
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>VideoPlayer(title)
        ));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>NetworkPage(title)
        ));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>WebViewPage(title)
        ));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SharePage()
        ));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ScanCodePage()
        ));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>BannerPage()
        ));
        break;
      case 6:
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>LocalWebViewPage(title)
      ));
      break;
      case 7:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>BaseWidgetPage()
        ));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>MapPage()
        ));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ComponentPage()
        ));
        break;

    }
  }
}
