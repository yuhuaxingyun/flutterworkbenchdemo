import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutterworkbench/utils/ToastUtil.dart';

class ScanCodePage extends StatefulWidget{
  @override
  State<ScanCodePage> createState(){
    return new _ScanCodeState();
  }
}

class _ScanCodeState extends State<ScanCodePage>{
  String qrData = 'This is a simple QR code';
  String content = '赶快扫一扫获取结果';
  GlobalKey repainKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扫码'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: (){
                scanCode();
          }),
          IconButton(
              icon: Icon(Icons.scanner),
              onPressed: (){
                saveImage();
              }),
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          color: Colors.white70, //背景颜色
          child: new Center(
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text('生成二维码的内容:$qrData'),
                  ),

                  RepaintBoundary(
                    key: repainKey,
                    child: new Container(
                        alignment: Alignment.center,
                        child: new QrImage(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 320,
                          gapless: false,
                        )
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,

                    child: new Container(
                      child: Text(content),
                    ),
                  ),
                ],
              )
          )
      )
    );
  }

  scanCode() async {
    try {
      var options = ScanOptions();
      ScanResult result = await BarcodeScanner.scan(options: options);
      print(
          '扫描结果: $result.type$result.rawContent+$result.format $result.formatNote');
      setState(() {
        content = result.rawContent;
      });
    }on PlatformException catch(e){
      if (e.code == BarcodeScanner.cameraAccessDenied){
        bool isOpened = await openAppSettings();
        print('未授予App相机权限');
      }else{
        print('扫码错误：$e');
      }
    }on FormatException{
      print('进入扫码页面未扫码就返回');
    } catch (e){
      print('扫码错误：$e');
    }
  }

  Future<Uint8List> capturePng() async {
    try {
      RenderRepaintBoundary boundary = repainKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }


  saveImage() async{

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      print('status:$status');
      return;
    }else{
      print('有权限');
    }

    Uint8List pngBytes = await capturePng();
    final result = await ImageGallerySaver.saveImage(pngBytes);
    print('result:$result');

    if (result == true){
      showTotast('保存相册成功');
    }else{
      showTotast('保存失败');
    }
  }
}