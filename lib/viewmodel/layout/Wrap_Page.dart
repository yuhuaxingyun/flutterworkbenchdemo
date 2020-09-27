import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class WrapPage extends StatefulWidget{
  @override
  State<WrapPage> createState() => _WrapState();
}

class _WrapState extends State<WrapPage> {
  var _isltr = false;
  var _isup = false;
  var _textDirection = TextDirection.ltr;
  var _verticalDirection = VerticalDirection.up;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
        actions: [
          CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.blueGrey,
              value: _isltr,
              onChanged: (value){
                setState(() {
                  _isltr = value;
                });
                if (_isltr == true){
                  _textDirection = TextDirection.rtl;
                }else{
                  _textDirection = TextDirection.ltr;
                }
              }
          ),

          CupertinoSwitch(
              activeColor: Colors.purple,
              trackColor: Colors.blueGrey,
              value: _isup,
              onChanged: (value){
                setState(() {
                  _isup = value;
                });
                if (_isup == true){
                  _verticalDirection = VerticalDirection.up;
                }else{
                  _verticalDirection = VerticalDirection.down;
                }
              }
          ),
        ],
      ),

      body: Container(
        width: ToolsUtil.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                spacing: 5,
                runSpacing: 3,
                textDirection: _textDirection, //从右向左或从左向右
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(10, (index) {
                  double w = 50.0 + 10 * index;
                  double h = 50.0 + 5 * index;
                  return Container(
                    color: Colors.primaries[index],
                    height: h,
                    width: w,
                    alignment: Alignment.center,
                    child: Text('$index'),
                  );
                }),
              ),

              SizedBox(height: 20,),

              Wrap(
                verticalDirection: _verticalDirection,
                direction: Axis.vertical,
                children: List.generate(4, (index){
                  double w = 50.0 + 10 * index;
                  return Container(
                    color: Colors.primaries[index],
                    height: 50,
                    width: w,
                    child: Text('$index'),
                  );
                }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}