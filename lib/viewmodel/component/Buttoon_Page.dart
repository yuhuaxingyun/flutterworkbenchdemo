import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget{
  @override
  State<ButtonPage> createState() => _ButtonState();
}

class _ButtonState extends State<ButtonPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                child: Text('RaisedButton:Material风格”凸起“的按钮'),
                onPressed: () {
                  print('RaisedButton:点击回调');
                },
                onLongPress: () {
                  print('RaisedButton:长按回调');
                },
                onHighlightChanged: (highlight) {
                  print('onHighlightChanged:$highlight');
                },
              ),

              RaisedButton(
                elevation: 10.0, //阴影
                textColor: Colors.white,
                color: Colors.blue,
                highlightColor: Colors.grey,
                splashColor: Colors.red,
                disabledTextColor: Colors.blueGrey,
                disabledColor: Colors.grey,
                /// 边框
                shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1,color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('RaisedButton:Material风格”凸起“的按钮'),
                onPressed: () {
                  print('RaisedButton:点击回调');
                },
                onLongPress: () {
                  print('RaisedButton:长按回调');
                },
                onHighlightChanged: (highlight) {
                  print('onHighlightChanged:$highlight');
                },
              ),

              FlatButton(


                child: Text('FlatButton:扁平的按钮'),
                onPressed: () {
                  print('FlatButton:点击回调');
                },
                onLongPress: () {
                  print('FlatButton:长按回调');
                },
                onHighlightChanged: (highlight) {
                  print('onHighlightChanged:$highlight');
                },
              ),
              
              OutlineButton(
                child: Text('OutlineButton:带边框的按钮'),
                onPressed: () {
                  print('OutlineButton:点击回调');
                },
                onLongPress: () {
                  print('OutlineButton:长按回调');
                },

              ),

              IconButton(
                icon: Icon(
                    Icons.add
                ),
              ),


              

            ],
          ),
        ),
      ),
    );
  }
}