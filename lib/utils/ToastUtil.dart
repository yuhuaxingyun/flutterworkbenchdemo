import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//提示，text为弹出的内容
void showTotast(String text,{gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_SHORT}){
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER, //消息框弹出的位置
    timeInSecForIosWeb: 1,  //消息框持续的时间
    backgroundColor: Colors.grey[600],
    fontSize: 16,
  );
}

//一个加载中的动画，不传text时，默认显示文字Loading
void showLoading(context,[String text]){
  text = text ?? "Loading...";
  showDialog(barrierDismissible: false,
             context: context,
             builder: (context){
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                        )
                      ]),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    constraints: BoxConstraints(minHeight: 120,minWidth: 180),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            text,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
             });
}
void dismissToast(BuildContext context){
  Navigator.of(context).pop();
}

//带有确定取消按钮的提示框，content是提示框的内容文字，confirmCallBlock是点击确定按钮的回调
void showConfirmDialog(BuildContext context,String content,Function confirmCallBlock){
  showDialog(
    context: context,
    builder: (context){
      return new AlertDialog(
        title: Text("提示"),
        content: new Text(content),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                confirmCallBlock();
              },
              child: new Text("确认")
          ),
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: new Text("取消"),
          ),
        ],
      );
    });
}

