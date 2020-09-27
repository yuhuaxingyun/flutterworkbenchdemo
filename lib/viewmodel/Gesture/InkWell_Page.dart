import 'package:flutter/material.dart';

class InkWellPage extends StatefulWidget{
  @override
  State<InkWellPage> createState() => _InkWellState();
}

class _InkWellState extends State<InkWellPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){

              },
              child: Text('这是InkWell点击效果'),
            ),
            InkWell(
              onTap: (){

              },
              splashColor: Colors.red,
              child: Text('这是InkWell 水波纹 效果'),
            ),
            InkWell(
              onTap: (){

              },
              highlightColor: Colors.blue,
              child: Text('这是InkWell 高亮 效果'),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text('这是InkWell 字体添加边距和圆角边框 效果'),
              ),
            ),

            Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFDE2F21), Color(0xFFEC592F)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            )
          ],
        ),
      ),
    );
  }
}