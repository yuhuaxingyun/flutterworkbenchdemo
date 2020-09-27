import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterworkbench/utils/ToastUtil.dart';
import 'package:flutterworkbench/view/listView/remove_child.dart';
import 'package:flutterworkbench/view/listView/result.dart';
import 'package:flutterworkbench/view/listView/bank_item.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';



class BaseWidgetPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<BaseWidgetPage> with TickerProviderStateMixin{
  AnimationController animationController;
  AnimationController clickAnimationController;

  //*************tableview 数据 *************//
  //section

  List listSections = new List();
  int positionNow = 0;
  List listKeySections = new List();

  @override
  void initState(){
    super.initState();
    initList();
    initAnimation();
  }
  void initList(){
    for (int i=0;i<5;i++){
      List<Result> list = List.generate(30, (index){
        Result result = new Result("title $index","detail $index");
        return result;
      });
      listSections.add(list);
      updateView(listSections);
    }
  }

  void initAnimation(){
    //自动动画
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();

    //点击开始动画
    clickAnimationController = AnimationController( vsync: this)
    ..drive(Tween(begin: 0,end: 1))
    ..duration = Duration(milliseconds: 400);
    clickAnimationController.forward();
  }

  void updateView(List listSections){

    listKeySections.clear();
    List<GlobalKey<RemoveItemState>> listKey = []; //通过给各个item设置key，点击其它item的时候，打开的item关闭
    for (int i=0;i<listSections.length;i++){
      List<Result> list = listSections[i];
      listKey.addAll(setKey(list.length));
      listKeySections.add(listKey);
    }
    setState(() {});
  }

  List<GlobalKey<RemoveItemState>> setKey(int length){
    var list=<GlobalKey<RemoveItemState>>[];
    for (int i = 0; i < length; i++) {
      var key=GlobalKey<RemoveItemState>();
      list.add(key);
    }
    return list;
  }


  void showLoginDialog() {

    showModalBottomSheet(context: context, builder: (context){
      return Container(height: 170,color: Colors.white,child: Column(children: <Widget>[
        SizedBox(height: 20,),
        Text("删除后将无法看到该条记录，请谨慎操作",style: TextStyle(color: Colors.grey,fontSize: 14),),
        SizedBox(height: 1,),
        Container(height: 50,width:double.infinity,margin:EdgeInsets.only(left: 15,right: 15),
          child:  FlatButton(onPressed:(){
            Navigator.of(context).pop();
            _deleteBank(context,0);
            showTotast("你点击了删除 $positionNow");
          },
            child: Text("删除",style: TextStyle(fontSize: 16,color:Colors.blue),),),),
        SizedBox(height: 10,),
        Container(height: 50,width:double.infinity,margin:EdgeInsets.only(left: 15,right: 15),
          child:  FlatButton(onPressed:(){Navigator.of(context).pop();}, child: Text("取消",style: TextStyle(fontSize: 14),),),),
      ],),);
    });
  }


  //row count
  int _rowCountAtSection(int section){
    List<Result> list = listSections[section];
    return list.length;
  }

  Widget _sectionHeaderBuilder(BuildContext context,int section){
    return InkWell(
      onTap: (){
        print('click section header -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text('Header -> section:$section'),
      ),
    );
  }


  Widget _cellBuilder(BuildContext context,int section,int row){
    List<Result> list = listSections[section];
    List<GlobalKey<RemoveItemState>> listKey = listKeySections[section];
    return InkWell(
      onTap: (){
        print('click cell item -> section:$section  row:$row');
        _pushTableViewCellDetail(section,row);
      },
      child: new ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(240, 240, 240, 1),
            )
          )
        ),
        height: 80.0,
        child: Dismissible(
          key: listKey[row],
          background: new Container(
              color: Colors.red,
              margin: EdgeInsets.only(top: 5),
              // child: Container(
              //   alignment: Alignment.centerRight,
              //   child: RaisedButton(
              //     child: Text('删除'),
              //     onPressed: null,
              //     textColor: Colors.white,
              //   ),
              // )
          ),
          child: Container(
            padding: EdgeInsets.only(top: 5),
            width:MediaQuery.of(context).size.width,
            child: RemoveWidget(list[row]),
          ),
          onDismissed: (direction) {
            // 根据位置移除
            positionNow = row;
            _deleteBank(context,section);
            // 提示
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("已移除 $positionNow")));
          },
        ),
      ),
      ),
    );
  }

  double _sectionHeaderHeiget(BuildContext context,int section){
    return 40;
  }

  double _cellHeight(BuildContext context,int section,int row){
    return 50;
  }

  _deleteBank(BuildContext context,int section){
    List<GlobalKey<RemoveItemState>> listKey = listKeySections[section];
    List<Result> list = listSections[section];
    listKey.removeAt(positionNow);
    list.removeAt(positionNow);
    setState(() {});
  }

  void _pushTableViewCellDetail(int section,int row) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('详情页:$section--$row'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Container(
              height: 200,
              child: Image.network('http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',fit: BoxFit.fill,),
            ),
          );
        },
      ),
    );
  }

  //*************Collection  数据 *************//
  _getGridData(){
    List<Widget> widgets = [];
    for (int i=0;i<20;i++) {
      var imageUrlStr = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554110093883&di=9db9b92f1e6ee0396b574a093cc987d6&imgtype=0&src=http://n.sinaimg.cn/sinacn20/151/w2048h1303/20180429/37c0-fzvpatr1915813.jpg';
      if (i%2 == 0){
        imageUrlStr = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598615953107&di=9c2a4cda089f2b2c096f8fd2a052129e&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F84%2F95%2F01300000244525126132956029806.jpg';
      }
      Image image = new Image.network(imageUrlStr, fit: BoxFit.cover,);
      InkWell inkWell = new InkWell(
        onTap: (){
          print('click cell item -> row:$i');
          _pushGridCollectionViewCellDetail(i,imageUrlStr);
        },
        child: image,
      );
      widgets.add(inkWell);
    }
    return widgets;
  }

  void _pushGridCollectionViewCellDetail(int row,String imageUrlStr) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('详情页:$row'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Container(
              color: Colors.red,
              width: ToolsUtil.screenWidth,
              height: 200,
              child: Image.network(imageUrlStr,fit: BoxFit.fill,),
            ),
          );
        },
      ),
    );
  }

  dispose(){
    super.dispose();
    animationController.dispose();
  }

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('基础控件'),
      actions: <Widget>[
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child:  AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: animationController,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: InkWell(
            child:  AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: clickAnimationController,
            ),
            onTap: (){
              if (clickAnimationController.status == AnimationStatus.completed) {
                clickAnimationController.reverse();
              } else if (clickAnimationController.status == AnimationStatus.dismissed) {
                clickAnimationController.forward();
              }
            },
          ),
        ),
      ],
    ),
    body: Container(
      child: Row(
        children: [
          new Expanded(
            child: new Container(
              color: Colors.white70,
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white70,
                        padding: EdgeInsets.all(5.0),
                        child: FlutterTableView(
                            sectionCount: listSections.length,
                            rowCountAtSection: _rowCountAtSection,
                            sectionHeaderBuilder: _sectionHeaderBuilder,
                            cellBuilder: _cellBuilder,
                            sectionHeaderHeight: _sectionHeaderHeiget,
                            cellHeight: _cellHeight,
                            listViewFatherWidgetBuilder:null,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.purple,
                                padding: EdgeInsets.all(5.0),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.orange,
                                padding: EdgeInsets.all(5.0),
                                child :Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        color: Colors.white54,
                                        padding: EdgeInsets.all(5.0),
                                        child: GridView.count(
                                          crossAxisCount: 1,
                                          padding: EdgeInsets.all(10.0),
                                          scrollDirection: Axis.horizontal,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          children: _getGridData(),
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.pink[50],
                                        padding: EdgeInsets.all(5.0),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),

                              ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.deepPurpleAccent,
                                padding: EdgeInsets.all(5.0),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        color: Colors.yellow,
                        padding: EdgeInsets.all(5.0),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightBlue,
                        padding: EdgeInsets.all(5.0),
                        // child: GridView(gridDelegate: null),

                        // GridView的几种使用方式
                        // count : 交叉轴上的Item个数是固定的，并且Item的宽高不由自己决定
                        // extent : Item所能达到的最大的尺寸（宽或者高)
                        // GridView : 必须要传一个gridDelegate参数，自定义一些效果
                        // builder、custom : 必须要传一个gridDelegate参数,再加上builder或custom
                        // GridView.count(@required int crossAxisCount)
                        // GridView.extent(@required double maxCrossAxisExtent)
                        // GridView(@required this.gridDelegate,List<Widget> children)
                        // GridView.builder(@required this.gridDelegate,@required IndexedWidgetBuilder itemBuilder)
                        // GridView.custom(@required this.gridDelegate,@required this.childrenDelegate)

                          child: GridView.count(
                            crossAxisCount: 3,
                            padding: EdgeInsets.all(10.0),
                            scrollDirection: Axis.vertical,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: [

                              new Container(
                                color: Colors.amber,

                              ),

                              new Container(
                                color: Colors.purple,
                              ),
                              new Container(
                                color: Colors.red,
                              ),
                              new Container(
                                color: Colors.orange,
                              ),
                              new Image.network(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554110093883&di=9db9b92f1e6ee0396b574a093cc987d6&imgtype=0&src=http://n.sinaimg.cn/sinacn20/151/w2048h1303/20180429/37c0-fzvpatr1915813.jpg",
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    ),
  );
  }
}