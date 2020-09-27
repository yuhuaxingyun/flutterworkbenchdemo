import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class SharePage extends StatefulWidget {
  @override
  State<SharePage> createState() {
    return new _ShareState();
  }
}

class _ShareState extends State<SharePage>{
  initShareSDK(){
    ShareSDKRegister register = ShareSDKRegister();
    register.setupWechat(
        "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1", "https://www.sandslee.com/");
    register.setupSinaWeibo("568898243", "38a4f8204cc784f81f9f0daaf31e02e3",
        "http://www.sharesdk.cn");
    register.setupQQ("100371282", "aed9b0303e3ed1e27bae87c33761161d");
    register.setupFacebook(
        "1412473428822331", "a42f4f3f867dc947b9ed6020c2e93558", "shareSDK");
    register.setupTwitter("viOnkeLpHBKs6KXV7MPpeGyzE",
        "NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey", "http://mob.com");
    register.setupLinkedIn("46kic3zr7s4n", "RWw6WRl9YJOcdWsj", "http://baidu.com");
    SharesdkPlugin.regist(register);

//    ShareSDKRegister register = ShareSDKRegister();
//
//    register.setupWechat("wx76f3856be06a9c6a","c7253e5289986cf4c4c74d1ccc185fb1","https://www.sandslee.com/");
//
//    register.setupSinaWeibo("1550659223","f7f24b1ffdf64888e8d0fe75e1fa6048","https://www.baidu.com/");
//
//    register.setupQQ("1105440940", "aed9b0303e3ed1e27bae87c33761161d");
//
//    SharesdkPlugin.regist(register);
  }

  @override
  void initState(){
    super.initState();
    if (Platform.isIOS){
      initShareSDK();
    }
  }

  void showAlert(SSDKResponseState state,Map content,BuildContext context){
    String title = "失败";
    switch(state){
      case SSDKResponseState.Success:
        title = "成功";
        break;
      case SSDKResponseState.Fail:
        title = "失败";
        break;
      case SSDKResponseState.Cancel:
        title = "取消";
        break;
      default:
        title = state.toString();
        break;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: new Text(title),
            content: new Text(content != null ? content.toString() : ""),
            actions: [
              new FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: new Text("OK"),
              )
            ],
          )
    );
  }

  // Image.asset("assets/images/placeholder.jpg")
  userWeChatShare(BuildContext context){
    SSDKMap params = SSDKMap()
      ..setGeneral('title', 'text', null, null, null, "https://www.baidu.com", null, null, null, null, SSDKContentTypes.auto);
    SharesdkPlugin.share(ShareSDKPlatforms.wechatSession, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error) {
      showAlert(state, error.rawData, context);
    });
  }

  userSinaShare(BuildContext context){
    SSDKMap params = SSDKMap()
      ..setGeneral('title', 'text', null, null, null, null, null, null, null, null, SSDKContentTypes.text);
    SharesdkPlugin.share(ShareSDKPlatforms.sina, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error) {
      showAlert(state, error.rawData, context);
    });
  }

  userQQShare(BuildContext context) {
    SSDKMap params = SSDKMap()
      ..setGeneral('title', 'text', null, null, null, null, null, null, null, null, SSDKContentTypes.text);
    SharesdkPlugin.share(
        ShareSDKPlatforms.qq, params, (SSDKResponseState state, Map userdata,
        Map contentEntity, SSDKError error) {
      showAlert(state, error.rawData, context);
    });
  }

  userFacebookShare(BuildContext context) {
    SSDKMap params = SSDKMap()
      ..setGeneral('title', 'text', null, null, null, null, null, null, null, null, SSDKContentTypes.text);
      SharesdkPlugin.share(
          ShareSDKPlatforms.facebook, params, (SSDKResponseState state,
          Map userdata, Map contentEntity, SSDKError error) {
        showAlert(state, error.rawData, context);
      });
    }

    userTwitterShare(BuildContext context){
      SSDKMap params = SSDKMap()
        ..setGeneral('title', 'text', null, null, null, null, null, null, null, null, SSDKContentTypes.text);
      SharesdkPlugin.share(ShareSDKPlatforms.twitter, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error) {
        showAlert(state, error.rawData, context);
      });
    }

  @override
  Widget build(BuildContext context) {
    double width =  ToolsUtil.screenWidth;
    double itemWidth = width - 60;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "分享",
          )
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              new Container(
                height: 80,
                alignment: Alignment.center,
                child:SizedBox(
                  width: itemWidth,
                  height: 60,
                  child: new RaisedButton(
                    child: Text('微信分享'),
                    onPressed: () {
                      userWeChatShare(context);
                    },
                    color: Colors.blue,

                  ),
                ),
              ),

              new Container(
                height: 80,
                alignment: Alignment.center,
                child:SizedBox(
                  width: itemWidth,
                  height: 60,
                  child: new CupertinoButton(
                    child: Text('QQ分享'),
                    onPressed: () {
                      userQQShare(context);
                    },
                    color: Colors.yellow,
                  ),
                ),
              ),

              new Container(
                height: 80,
                alignment: Alignment.center,
                child:SizedBox(
                  width: itemWidth,
                  height: 60,
                  child: new CupertinoButton(
                    child: Text('微博分享'),
                    onPressed: () {
                      userSinaShare(context);
                    },
                   color: Colors.blue,
                  ),
                ),
              ),

              new Container(
                height: 80,
                alignment: Alignment.center,
                child:SizedBox(
                  width: itemWidth,
                  height: 60,
                  child: new CupertinoButton(
                    child: Text('Facebook分享'),
                    onPressed: () {
                      userFacebookShare(context);
                    },
                    color: Colors.blue,
                  ),
                ),
              ),

              new Container(
                height: 80,
                alignment: Alignment.center,
                child:SizedBox(
                  width: itemWidth,
                  height: 60,
                  child: new CupertinoButton(
                    child: Text('Twitter分享'),
                    onPressed: () {
                      userTwitterShare(context);
                    },
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

