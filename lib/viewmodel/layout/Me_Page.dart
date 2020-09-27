import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class MePage extends StatefulWidget{
  @override
  State<MePage> createState() => _MeState();
}

class _MeState extends State<MePage> {

  // 数据源
  List<Map> list = <Map>[
    {'iconData':Icons.notifications,'color':Colors.blue,'title':"消息中心","suffix":"2"},
    {'iconData':Icons.thumb_up,'color':Colors.green,'title':"我赞过的","suffix":"12篇"},
    {'iconData':Icons.grade,'color':Colors.deepOrange,'title':"收藏集","suffix":"2个"},
    {'iconData':Icons.shopping_basket,'color':Colors.yellow,'title':"已购小册","suffix":"100个"},
    {'iconData':Icons.account_balance_wallet,'color':Colors.blue,'title':"我的钱包","suffix":"10万"},
    {'iconData':Icons.location_on,'color':Colors.grey,'title':"阅读过的文章","suffix":"1034篇"},
    {'iconData':Icons.local_offer,'color':Colors.purple,'title':"标签管理","suffix":"27个"},
    {'iconData':Icons.person,'color':Colors.blue,'title':"关于","suffix":""},
  ];

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  print('点击$index');
                },
                child: _SettingItem(
                  iconData: list[index]['iconData'],
                  iconColor: list[index]['color'],
                  title: list[index]['title'],
                  suffix: _Suffix(
                    text: list[index]['suffix'],
                  ),
                  // row: index,
                ),
              );
            },
            separatorBuilder: (context, index) => new Divider(),
            itemCount: list.length,
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem(
      {
        Key key,
        this.iconData,
        this.iconColor,
        this.title,
        this.suffix,
        // this.row,
      }): super(key:key);
  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;
  // final int row,

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 45,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Icon(iconData,color: iconColor,),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text('$title'),
            ),
            suffix,
            SizedBox(
              width: 15,
            ),
          ],
        ),
    );
  }
}

class _Suffix extends StatelessWidget {
  final String text;
  const _Suffix({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(color: Colors.grey.withOpacity(.5)),
    );
  }
}