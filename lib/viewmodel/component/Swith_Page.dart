import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget{
  @override
  State<SwitchPage> createState() => _SwitchState();
}

class _SwitchState extends State <SwitchPage> {
  @override
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
        title: Text('Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Switch(
                value: _switchValue,
                onChanged: (value){
                  setState(() {
                    _switchValue = value;
                  });
                }
            ),

            Switch(
              activeThumbImage: AssetImage("assets/images/placeholder.jpg"),
                value: _switchValue1,
                onChanged: (value){
                  setState(() {
                    _switchValue1 = value;
                  });
                }
            ),

            Switch(
                inactiveThumbImage: AssetImage("assets/images/placeholder.jpg"),
                value: _switchValue2,
                onChanged: (value){
                  setState(() {
                    _switchValue2 = value;
                  });
                }
            ),

            Switch(
                activeColor: Colors.red,
                activeTrackColor: Colors.deepPurple,
                value: _switchValue3,
                onChanged: (value){
                  setState(() {
                    _switchValue3 = value;
                  });
                }
            ),

            SwitchListTile(
                title: Text('是否允许4G下载'),
                value: _switchValue4,
                onChanged: (value){
                  setState(() {
                    _switchValue4 = value;
                  });
                }
            ),

            CupertinoSwitch(
                activeColor: Colors.purple,
                value: _switchValue5,
                onChanged: (value){
                  setState(() {
                    _switchValue5 = value;
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}