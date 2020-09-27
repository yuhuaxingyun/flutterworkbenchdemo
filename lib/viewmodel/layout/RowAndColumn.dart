import 'package:flutter/material.dart';

class RowAndColumnPage extends StatefulWidget{
  @override
  State<RowAndColumnPage> createState() => _RowAndColumnState();
}

class _RowAndColumnState extends State<RowAndColumnPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColumn'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              new Container(
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, //对齐方式共六种：start
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, //对齐方式共六种：center
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end, //对齐方式共六种：end
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              // new Container(
              //   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.stretch, //对齐方式共六种：stretch
              //     children: [
              //       Container(
              //         height: 20,
              //         width: 100,
              //         color: Colors.red,
              //       ),
              //       Container(
              //         height: 40,
              //         width: 100,
              //         color: Colors.green,
              //       ),
              //       Container(
              //         height: 60,
              //         width: 100,
              //         color: Colors.blue,
              //       ),
              //     ],
              //   ),
              // ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //只有间隔
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 所有间距一样
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, //第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisSize: MainAxisSize.min, //尽可能的小
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisSize: MainAxisSize.max, //尽可能的大
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  textDirection: TextDirection.ltr, // 从左到右
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  textDirection: TextDirection.rtl, // 从右到左
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  /// start:从底部开始到顶部,end:从顶部到底部结束
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  /// start:从顶部开始到底部,end:从底部到顶部结束
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

            ],
          )

        ),
      ),
    );
  }
}