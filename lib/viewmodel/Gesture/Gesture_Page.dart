import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget{
  @override
  State<GesturePage> createState() => _GestureState();
}

class _GestureState extends State<GesturePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text('*********** 点击事件 **********'),
            ),

            GestureDetector(
              onTapDown: (TapDownDetails tapDownDetails){
                print('onTapDown:按下时调用');
              },
              onTapUp: (TapUpDetails tapUpDetails){
                print('onTap:抬起时调用');
              },
              onTap: (){
                print('onTap:点击时回调');
              },
              
              onTapCancel: (){
                print('onTapCancel:点击取消事件回调');
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              )
            ),

            Container(
              child: Text('*********** 双击事件 **********'),
            ),

            GestureDetector(
              onDoubleTap: (){
                print('onDoubleTap:双击事件');
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),

            Container(
              child: Text('*********** 长按事件 **********'),
            ),

            GestureDetector(
              onLongPressStart: (e){
                print('onLongPressStart:长按开始事件回调');
              },
              onLongPressMoveUpdate: (e){
                print('onLongPressMoveUpdate:长按移动事件回调');
              },
              onLongPressUp: (){
                print('onLongPressUp:长按抬起事件回调');
              },
              onLongPressEnd: (e){
                print('onLongPressEnd:长按结束事件回调');
              },
              onLongPress: (){
                print('onLongPress:长按事件回调');
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ),

            Container(
              child: Text('*********** 水平/垂直拖动事件 **********'),
            ),

            /// Vertical: 垂直; Horizontal:水平
            GestureDetector(
              onVerticalDragStart: (e){
                print('onVerticalDragStart：垂直拖动开始事件回调');
              },
              onVerticalDragDown: (e){
                print('onVerticalDragDown：垂直拖动按下事件回调');
              },
              onVerticalDragUpdate: (e){
                print('onVerticalDragUpdate：指针移动更新事件回调');
              },
              onVerticalDragEnd: (e){
                print('oonVerticalDragEnd：垂直拖动结束事件回调');
              },
              onVerticalDragCancel: (){
                print('onVerticalDragCancel：垂直拖动取消事件回调');
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
            ),

            Container(
              child: Text('*********** 缩放事件 **********'),
            ),

            GestureDetector(
              onScaleStart: (e){
                print('onScaleStart：缩放开始事件回调');
              },
              onScaleUpdate: (ScaleUpdateDetails v){
                print('onScaleUpdate：缩放更新事件回调');
              },
              onScaleEnd: (e){
                print('oonScaleEnd：缩放结束事件回调');
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            )

          ],
        ),
      ),
    );
  }
}