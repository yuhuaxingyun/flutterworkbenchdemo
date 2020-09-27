import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget{
  @override
  var _title;
  ImagePage(this._title);
  State<ImagePage> createState() => _imageState(this._title);
}

class _imageState extends State <ImagePage> {
  @override
  var _title;

  _imageState(this._title);

  var _switchValue = false;
  var _switchValue1 = true;
  var _switchValue2 = false;
  var _switchValue3 = false;
  var _switchValue4 = false;
  var _switchValue5 = true;


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                Image.network(
                  'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
                ),
                Image.asset("assets/images/placeholder.jpg",height: 100,),
                Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598616099010&di=9b19cd08e8a52a457ad9371fe1b380ca&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121129%2F2843163_123958594362_2.jpg',
                  fit: BoxFit.fill,
                ),
                Container(

                  color: Colors.red.withOpacity(.6),
                  child: Image.asset('assets/images/placeholder.jpg',width: 150,height: 150,fit: BoxFit.none,),
                ),

                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Image.network(
                      'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
                      height: 200,
                      matchTextDirection: true,
                    ),
                ),

                Icon(Icons.add),
                Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.red,
                ),

                Container(
                  width: 300,
                  padding: EdgeInsets.only(left: 8,top: 8,right: 20,bottom: 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        centerSlice: Rect.fromLTWH(20, 20, 1, 1), /// .9图拉伸
                        image: AssetImage("assets/images/chat.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text('老子，专注分享Flutter技术和应用实战。'
                      '孔子，专注分享Flutter技术和应用实战。'
                      '孟子，专注分享Flutter技术和应用实战。'),
                  // color: Colors.red,
                ),

                Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/placeholder.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Image.network(
                  'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  frameBuilder: (
                      BuildContext context,
                      Widget child,
                      int frame,
                      bool wasSynchronouslyLoaded,
                  ){
                    if (frame == null){
                      return Image.asset(
                        'assets/images/placeholder.jpg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      );
                    }
                    return child;
                  },
                ),

                Container(
                  child: IconButton(
                      icon: Icon(IconData(0xe674,fontFamily: 'appIconFonts')),
                      onPressed: (){
                        print('阿里Iconfont');
                      }
                  ),
                ),
              ]
          ),
        ),
      )
    );
  }

}