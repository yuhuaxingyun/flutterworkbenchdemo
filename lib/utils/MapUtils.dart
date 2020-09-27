import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'ToastUtil.dart';

class MapUtil {
  // 高德地图
  static Future <bool> gotoGaodeMap(double longitude, double latitude) async {
    var url = '${Platform.isAndroid ?' android ':'ios' }amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2';
    url = Uri.encodeFull(url);
    bool canLaunchUrl = await canLaunch(url);
    if (!canLaunchUrl) {
      showTotast('未检测到高德地图~');
      return false;
    }

    await launch(url);
    return true;
  }

  // 腾讯地图
  static Future<bool> gotoTencentMap(double longitude, double latitude) async {
    var url = 'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
    url = Uri.encodeFull(url);
    bool canLaunchUrl = await canLaunch(url);
    if (!canLaunchUrl) {
      showTotast('未检测到腾讯地图~');
      return false;
    }

    await launch(url);
    return canLaunchUrl;
  }

  // 百度地图
  static Future<bool> gotoBaiduMap(double longitude, double latitude) async {
    var url = 'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';
    url = Uri.encodeFull(url);
    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      showTotast('未检测到百度地图~');
      return false;
    }

    await launch(url);
    return canLaunchUrl;
  }

  // 苹果地图
  static Future<bool> gotoAppleMap(double longitude, double latitude) async {
    var url = 'http://maps.apple.com/?&daddr=$latitude,$longitude';
    url = Uri.encodeFull(url);
    bool canLaunchUrl = await canLaunch(url);
    if (!canLaunchUrl) {
      showTotast('打开失败~');
      return false;
    }

    await launch(url);
  }
}