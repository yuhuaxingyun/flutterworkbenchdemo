import 'dart:ui';

class ToolsUtil {
  //基本信息
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double screenWidth;
  static double screenHeight;
  static double statusHeight;

  static double rpx;
  static double px;


  static void initialize({double standardSize = 750}){
    /// 手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    /// 获取dpr
    dpr = window.devicePixelRatio;

    /// 宽度和高度
    screenWidth = physicalWidth/dpr;
    screenHeight = physicalHeight/dpr;

    /// 状态栏高度
    statusHeight = window.padding.top/dpr;

    /// 计算rpx px的大小, iPhone6下 1px = 2rpx
    rpx = screenWidth/standardSize;
    px = screenWidth/standardSize*2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }

}




