import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class BannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<BannerPage> {
  List _imagePageUrl = ['http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598615953107&di=9c2a4cda089f2b2c096f8fd2a052129e&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F84%2F95%2F01300000244525126132956029806.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598616099010&di=9b19cd08e8a52a457ad9371fe1b380ca&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121129%2F2843163_123958594362_2.jpg',

  ];
  var scale = 1.0;
  double value = 1;
  bool isSwitch = true;
  bool autoplay = true;
  bool isCupSwitch = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Banner"),
      ) ,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Container(
                width: ToolsUtil.screenWidth*scale,
                height: 200*scale,
                child: Swiper(
                  itemCount: _imagePageUrl.length,
                  autoplay: autoplay,
                  itemBuilder: (BuildContext context,int index){
                    Image _image;

                    _image = Image.network(_imagePageUrl[index],fit: BoxFit.fill,);
                    var resolve = _image.image.resolve(ImageConfiguration.empty);
                    resolve.addListener(ImageStreamListener((_,__){

                    },onError: (dynamic exception,StackTrace stackTrace){
                      setState(() {
                        _image = Image.asset("assets/images/placeholder.jpg");
                      });
                    }));
                    return _image;
                  },
                  onTap: (index) => print('点击了第$index个'),
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                  ),
                  control: new SwiperControl(),
                ),
              ),
            ),

            Slider(
                value: this.value,
                min: 0.5,
                max: 1,
                divisions: 5, // 设置多少段
                activeColor: Colors.amber,
                label: this.value.toString(),
                onChanged: (double v) {
                  setState(() {
                    this.value = v;
                    this.scale = v;
                  });
                },
              onChangeStart: (double startValue) {
                  print('startValue:$this.value');
              },
              onChangeEnd: (double endValue){
                  print('endValue:$this.value');
              },
              semanticFormatterCallback: (double newValue){
                  return '${newValue.round()} dollars';
              },
            ),

            CupertinoSwitch(
                activeColor: Colors.purple,
                value: isSwitch,
                onChanged: (val) {
                  setState(() {
                    isSwitch = val;
                  });
                  if (isSwitch == true){
                    this.autoplay = true;
                  }else{
                    this.autoplay = false;
                  }
                },

            ),


            Switch(
              activeColor: Colors.green,
              value: isCupSwitch,
              onChanged: (val){
                setState(() {
                  isCupSwitch = val;
                });
                if (isCupSwitch == true){
                  this.isCupSwitch = true;
                }else{
                  this.isCupSwitch = false;
                }

              },
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
              )
            ),


            // Container(
            //   width: ToolsUtil.screenWidth,
            //   height: 50.0,
            //   child: new Builder(
            //     builder: (BuildContext context){
            //       RenderBox box = context.findRenderObject();
            //       final Shader linearGradient = LinearGradient(
            //         colors: <Color>[Colors.purple,Colors.blue],
            //       ).createShader(
            //           Rect.fromLTWH(0.0, 0.0, box.size.width, box.size.height));
            //       return Text(
            //         '专注分享Flutter技术和应用实战',
            //         style: new TextStyle(
            //             fontSize: 18.0,
            //             fontWeight: FontWeight.bold,
            //             foreground: Paint()..shader = linearGradient),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),

      ),

    );
  }

}