import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/ToastUtil.dart';
import 'package:flutterworkbench/utils/DioUtils.dart';

class NetworkPage extends StatefulWidget {
  var _title;
  NetworkPage(this._title);

  @override
  State<StatefulWidget> createState() {
    return _networkState(_title);
  }
}

class _networkState extends State<NetworkPage> {
  var _title;
  _networkState(this._title);
  var result;

  getRequest(){
    //    DioUtils.getHttp();

    FormData formData = FormData.fromMap({});

    // FormData formData = FormData.fromMap({
    //   "date" : 20131129,
    //   "startRecord" : 1,
    //   "len" : 5,
    //   // "udid" : 1234567890,
    //   "terminalType" : "Iphone",
    //   "cid" : 213,
    // });


    var reult = DioUtils.request('',
        parameters: formData,
        method: 'get',
        onSuccess: (data){
          showTotast('成功:$data');
          setState(() {
            result = data;
          });

        },onError: (error){
          showTotast('失败:$error');
          setState(() {
            result = error;
          });
        }
    );
    print('result:$reult');
  }

  postRequest(){
    // 两种方式，传字典和FormData 需要修改DioUtils
//    var formData  = {"devIds":"584512522"};
    FormData formData = FormData.fromMap({
      "devIds":"584512522",
    });

    DioUtils.postHttp(
      "http://api.heclouds.com/devices/datapoints?",
      parameters: formData,
      onSuccess: (data) {
        showTotast('成功:$data');
        setState(() {
          result = data;
        });
      },
      onError: (error) {
        showTotast('失败:$error');
        setState(() {
          result = error;
        });
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
          title: Text(_title),
        ),
      body: Container(
        child: new Center(
          child: ListView(
            children: <Widget>[
              RaisedButton(
                onPressed:() {
                  getRequest();
                },
                child: Text("GET请求"),
              ),

              RaisedButton(
                onPressed:() {
                  postRequest();
                },
                child: Text("POST请求"),
              ),
              Text("结果:$result"),
            ],
          ),
        ),
      ),
    );
  }
}