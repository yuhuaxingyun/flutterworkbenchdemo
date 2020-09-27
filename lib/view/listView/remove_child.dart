import 'package:flutter/material.dart';
import 'package:flutterworkbench/view/listView/result.dart';

class RemoveWidget extends StatelessWidget {

  final Result result;

  RemoveWidget(this.result);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.blue,), child: Row(children: <Widget>[
      // SizedBox(width: 15,),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Image.asset("assets/images/placeholder.jpg",fit: BoxFit.fill,width: 40,height: 40,),
              Expanded(
                child:Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child:Column(mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(result.title,style: TextStyle(color: Colors.white),),
                        Text(result.detail,style: TextStyle(color: Colors.white),),
                      ],
                    )
                )
              ),
            ],
          ),

        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(right: 10.0),
          width: 40,
          child: Row(
              /// TextDirection.ltr : The text flows from left to right
              /// TextDirection.rtl : The text flows from right to left
              textDirection:TextDirection.rtl,

              children: <Widget>[
                Image.asset("assets/images/placeholder.jpg",fit: BoxFit.fill,width: 40,height: 40,),
                Text('this is value')
            ]
          ),
        )
      ),
    ],),);
  }
}