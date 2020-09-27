import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterworkbench/utils/ToastUtil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _getFile() async {
  //此html即为文件名'membership_agreement.html'
  return await rootBundle.loadString('widget.html');
}

class WebViewPage extends StatefulWidget {
  var _title;
  var _url = "https://flutterchina.club/";
  WebViewPage(this._title);

  @override
  _WebViewPageState createState() => _WebViewPageState(_title);
}

class _WebViewPageState extends State<WebViewPage>{
  var _title;
  _WebViewPageState(this._title);
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar (
        middle: Text(_title),
      ),
      child: SafeArea(
        child: WebView(
          initialUrl: widget._url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            _controller = controller;
          },

          onPageStarted: (url){
            showLoading(context,"正在加载中...");
//            EasyLoading.show(status: '加载中...');
          },

          onPageFinished: (url){
            dismissToast(context);
//            EasyLoading.dismiss();
            _controller.evaluateJavascript("document.title").then((result){
              setState(() {
                _title = result;
              });
            });
          },

          navigationDelegate: (NavigationRequest request){
            if (request.url.startsWith('js://webview')){
              showTotast('JS调用了Flutter By navigationDelegate');
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },


          javascriptChannels: <JavascriptChannel>[
            _alertJavascriptChannel(context),
          ].toSet(),
        ),
      ),
    );
  }

  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toast',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        });
  }

  callBlock(){
    print("呵呵");
  }

}

