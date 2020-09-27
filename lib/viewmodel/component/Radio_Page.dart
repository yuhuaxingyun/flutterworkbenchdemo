import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class RadioPage extends StatefulWidget{
  @override
  State<RadioPage> createState() => _RadioState();
}

class _RadioState extends State <RadioPage>{
  @override
  var _radioGroupValue = '男';
  var _radioGroupValue1 = '语文';
  List <String> titleItems = <String>['语文','数学','物理','化学','英语'];
  var _checkValue = false;
  var _checkValue1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initList();
  }

  void initList() {
    List<RadioListTile> list = <RadioListTile>[];
    // List<Widget> list =  <Widget>[],
    for (int i=0;i<titleItems.length;i++) {
      String titleItem =  titleItems[i];
      RadioListTile radioListTile = RadioListTile(
          title: Text(titleItem),
          value: titleItem,
          groupValue: _radioGroupValue1,
          onChanged: (value) {
            setState(() {
              _radioGroupValue1 = value;
            });
          }
      );
      list.add(radioListTile);
    }
  }

  _buildCheckBox(){
    return Checkbox(
        value: _checkValue,
        onChanged: (value){
          setState(() {
            _checkValue = value;
          });
        },
        activeColor: Colors.grey,
        checkColor: Colors.blue,
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Radio'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Radio(
                          value: '男',
                          groupValue: _radioGroupValue,
                          onChanged: (value){
                            setState(() {
                              _radioGroupValue = value;
                            });
                          }
                      ),

                      Radio(
                          activeColor: Colors.red,
                          value: '女',
                          groupValue: _radioGroupValue,
                          onChanged: (value){
                            setState(() {
                              _radioGroupValue = value;
                            });
                          }
                      ),
                    ],
                  ),
                ),

                Container(
                  width: ToolsUtil.screenWidth,
                  height: 50,
                  child: Row(
                    children: [
                      Flexible(
                        child: RadioListTile(
                          title: Text('语文'),
                          value: '语文',
                          groupValue: _radioGroupValue1,
                          onChanged: (value) {
                            setState(() {
                              _radioGroupValue1 = value;
                            });
                          },
                        ),
                      ),
                      Flexible(
                          child: RadioListTile(
                            title: Text('数学'),
                            value: '数学',
                            groupValue: _radioGroupValue1,
                            onChanged: (value) {
                              setState(() {
                                _radioGroupValue1 = value;
                              });
                            },
                          )),
                      Flexible(
                          child: RadioListTile(
                            title: Text('物理'),
                            value: '物理',
                            groupValue: _radioGroupValue1,
                            onChanged: (value) {
                              setState(() {
                                _radioGroupValue1 = value;
                              });
                            },
                          )),
                      Flexible(
                          child: RadioListTile(
                            title: Text('英语'),
                            value: '英语',
                            groupValue: _radioGroupValue1,
                            onChanged: (value) {
                              setState(() {
                                _radioGroupValue1 = value;
                              });
                            },
                          )),
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  child: _buildCheckBox(),
                ),

                Container(
                  width: 300,
                  height: 50,
                  child: CheckboxListTile(
                    title: Text('老子'),
                    value: _checkValue1,
                    onChanged: (value){
                      setState(() {
                        _checkValue1 = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),



              ],
            )
          )
        )
    );
  }
}