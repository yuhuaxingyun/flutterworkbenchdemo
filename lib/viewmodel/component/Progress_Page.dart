import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget{
  @override
  var _title;
  ProgressPage(this._title);
  State<ProgressPage> createState() => _ProgressState(this._title);
}

class _ProgressState extends State <ProgressPage> {
  @override
  var _title;
  _ProgressState(this._title);

  var _switchValue = false;
  var _switchValue1 = true;
  var _switchValue2 = false;
  var _switchValue3 = false;
  var _switchValue4 = false;
  var _switchValue5 = true;


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: LinearProgressIndicator(),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: LinearProgressIndicator(
                  value: 0.3,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: LinearProgressIndicator(
                  value: 0.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red), /// 进度颜色动画
                  backgroundColor: Colors.grey,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                // height: 50,
                // width: 50,
                child: CircularProgressIndicator(
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red), /// 进度颜色动画
                  backgroundColor: Colors.greenAccent,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: CupertinoActivityIndicator(
                  radius: 30,
                ),
              ),


            ]
        ),
      ),
    );
  }
}