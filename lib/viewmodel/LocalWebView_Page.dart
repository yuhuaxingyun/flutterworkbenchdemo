import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class LocalWebViewPage extends StatefulWidget {
  var _title;
  LocalWebViewPage(this._title);
 // var url = "https://flutterchina.club/";
  // var url = 'assets/h5/widget.html';
  var url = "https://pub.flutter-io.cn";

  @override
  State<LocalWebViewPage> createState() {
    return new _LocalWebViewState(_title);
  }
}

class _LocalWebViewState extends State<LocalWebViewPage> {
  var _title;
  _LocalWebViewState(this._title);

  bool _loading = false;
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //加载  远程网页 OR 本地网页
    var isRemote = widget.url.contains('http');
    return
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar (
          middle: Text(_title),
        ),
        child:
        Stack(
          children: <Widget>[
            Scaffold(
              body: isRemote ? loadRemoteUrl() : loadAssetsUrl(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _webViewController
                      ?.evaluateJavascript(
                      'customeFunc("Flutter 调用 JS Time: ${DateTime.now().toUtc()}")')
                      ?.then((result) {
                    // You can handle JS result here.
                    print("customeFunc" + result);
                  });
                },
                child: Text('调用JS'),
              ),
            ),
        //加载网页提示
          uiLoading()
          ],
       )
      );
  }

  Widget uiLoading() {
    if (_loading)
      return Center(child:CircularProgressIndicator()) ;//Center(child: Icon(Icons.play_circle_filled));
    else
      return Container(height: 0.0, width: 0.0);
  }
  // 定义 网页中能够调用的 Flutter 方法
  JavascriptChannel jsChannelShowToast(BuildContext context) {
    return JavascriptChannel(
        name: 'flutterShowToast',
        onMessageReceived: (JavascriptMessage message) {
          Fluttertoast.showToast(
              msg: message.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
  }
  ///JS和Flutter通信的Channel；
  /// js 调用 flutter 方法
  List<JavascriptChannel> _getWebViewJavascriptChannels() {
    return <JavascriptChannel>[
      jsChannelShowToast(context),
    ];
  }
  _navigationDelegateHandle(NavigationRequest request) {
    print('request.url =======> : ${request.url}');
    //路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
    ///通过拦截url来实现js与flutter交互
    if (request.url.toLowerCase().startsWith('webviewflutterurl://')) {
      // Fluttertoast.showToast(msg:'JS调用了Flutter By navigationDelegate');
      print('blocking navigation to $request}');
      return NavigationDecision.prevent;
      ///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
    }
    return NavigationDecision.navigate;
    //允许路由替换
  }
  ///页面加载完成处理
  _onPageFinished(String url) async {
    // 获取当前加载页面的 title
    _webViewController.evaluateJavascript("document.title").then((result){
      setState(() {
        _title = result;
        _loading = false;
      });
    });

    print('Page finished url ====> : $url');
    //添加一些 webview 初始化数据
    var jsonData = {'platform': Platform.isAndroid ? 'android' : 'ios'};
    var jsonDataString = jsonEncode(jsonData);
    print(jsonDataString);
    //通知网页服务器加载完成并触发加载完成事件
    _webViewController
        ?.evaluateJavascript(
        'triggerEventWebViewFlutterJSBridgeReady($jsonDataString)')
        ?.then((result) {
      print(result);
    });
  }

  ///加载 远程 html
  Widget loadRemoteUrl() {
    return WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          setState(() { _loading = true; });
          _webViewController = webViewController;
        },
        javascriptChannels: _getWebViewJavascriptChannels().toSet(),
        navigationDelegate: (request) => _navigationDelegateHandle(request),
        onPageFinished: (url) => _onPageFinished(url));
  }

  ///加载 本地 html
  Widget loadAssetsUrl() {
    return FutureBuilder(
        future: _loadHtmlFile(),
        builder: (context, snapshot) => WebView(
            initialUrl: Uri.dataFromString(snapshot.data, mimeType: 'text/html',  encoding: Encoding.getByName('utf-8')) .toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() { _loading = true; });
              _webViewController = webViewController;
            },
            javascriptChannels: _getWebViewJavascriptChannels().toSet(),
            navigationDelegate: (request) => _navigationDelegateHandle(request),
            onPageFinished: (url) => _onPageFinished(url)));
  }
  /// 加载本地 HTML 文件
  Future<String> _loadHtmlFile() async {
    return await rootBundle.loadString(widget.url);

  }
}
