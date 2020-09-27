import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextPage extends StatefulWidget{
  @override
  State<TextPage> createState() => _TextState();
}

class _TextState extends State<TextPage>{
  @override
  var _textFieldValue = '';
  int _totalLenght = 32;
  var _person = '@孙子：';

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text('Text'),
              Text('TextStyle',style: TextStyle(color: Colors.purple,fontSize: 20),),
              Text('Textbold:w100~w900',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Textitalic',style: TextStyle(fontStyle: FontStyle.italic),),
              Container(
                width: 200,
                height: 50.0,
                color: Colors.blue.withOpacity(.4),
                child: Text('TextAlign：left：左对齐、right：右对齐、center：居中、justify：两端对齐、start：前端对齐、end：末端对齐',textAlign: TextAlign.center,softWrap: true,),
              ),

              Container(
                width: 200,
                height: 50.0,
                color: Colors.yellow.withOpacity(.4),
                child: Text('Text SoftWrap: 自动换行 Flutter技术和应用实战',softWrap:true,),
              ),

              Container(
                width: 200,
                height: 50.0,
                color: Colors.blue.withOpacity(.4),
                child: Text('TextOverflow: 文本溢出=> clip：直接裁剪、fade：越来越透明、ellipsis：省略号结尾、visible：依然显示，此时将会溢出父组件',overflow:TextOverflow.ellipsis,),
              ),

              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <InlineSpan>[
                      TextSpan(text: '富文本',style: TextStyle(color: Colors.purple,fontSize: 18.0)),
                      TextSpan(text: ','),
                      TextSpan(text: '这是一个富文本',style: TextStyle(fontSize: 18.0)),
                    ]
                ),
              ),

              RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <InlineSpan>[
                        TextSpan(text: '我已阅读并同意',style: TextStyle(fontSize: 18.0)),
                        TextSpan(
                          text: '《xxx服务条款》',
                          style: TextStyle(color: Colors.purple,fontSize: 18.0),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            print('点击了服务条款');
                          },
                        ),
                      ]
                  )
              ),

              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Container(
                            height: 30.0,
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue),
                            child: Text(
                              '判断题',
                              style: TextStyle(color: Colors.white,fontSize: 20.0),
                            ),
                          )),
                      TextSpan(text: '泡沫灭火器可用于带电灭火',style: TextStyle(fontSize: 18.0)),

                    ]),
              ),

              Text.rich(
                TextSpan(
                    text: '回复',
                    style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                    children: [
                      TextSpan(
                        text: _person,
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('点击了${_person}');
                          },
                      ),
                      TextSpan(
                        text: '你想知道Flutter后期发展前景如何？',
                      ),
                    ]),
              ),

              /// 输入文本
              TextField(),
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.person),
                ),
              ),

              TextField(
                scrollPadding: EdgeInsets.all(20.0),
                decoration: InputDecoration(
                  hintText: '请输入手机号',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                keyboardType: TextInputType.phone,

              ),

              TextField(
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              TextField(
                onChanged: (value){
                  setState(() {
                    _textFieldValue = value;
                  });
                },
                decoration: InputDecoration(
                  counterText: '${_textFieldValue.length}/${_totalLenght}',
                  prefixIcon: Icon(Icons.person),
                  hintText: '请输入用户名',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),


              TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  labelStyle: TextStyle(color: Colors.red),
                  helperText: '用户名为邮箱或手机号',
                  helperStyle: TextStyle(color: Colors.blue),
                  hintText: '请输入用户名',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: '用户名输入错误',
                  errorStyle: TextStyle(color: Colors.red,fontSize: 12),
                  errorMaxLines: 1,
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  fillColor: Color(0x30cccccc),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  hintText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value){

                },
              ),
            ],
          ),
        )
      ),
    );
  }
}