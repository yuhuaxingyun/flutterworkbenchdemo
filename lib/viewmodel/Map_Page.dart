import 'package:flutter/material.dart';
import 'package:flutterworkbench/utils/MapUtils.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart'; //经纬度
import 'package:proj4dart/proj4dart.dart' as proj4;

class MapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MapState();
  }
}

class MapState extends State<MapPage> {
  LatLng loc = new LatLng(30.2084,120.21201);

  // List resolutions = [32768, 16384, 8192, 4096, 2048, 1024, 512, 256, 128];
  //
  // double maxZoom = (resolutions.length - 1).toDouble();
  //
  // Proj4Crs epsg3413CRS = Proj4Crs.fromFactory(
  //     code: 'EPSG:3413',
  //     proj4Projection: proj4.Projection.add('EPSG:3413', '+proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'),
  //     resolutions: resolutions
  // );


  SelectView(IconData icon,String text,String id){
    return new PopupMenuItem(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon,color:Colors.blue ,),
          new Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text('地图'),
        actions: <Widget>[
          // ListTile(
          //   title: Text('调用',textAlign: TextAlign.center),
          //   onTap: () {
          //     openModalBottomSheet();
          //   },
          // ),
          IconButton(
              icon: Icon(Icons.redeem),
              onPressed: (){
                openModalBottomSheet();
              }
              ),
          PopupMenuButton(
              itemBuilder: (BuildContext context) =><PopupMenuItem<String>>[
                this.SelectView(Icons.message,'发起群聊','A'),
                this.SelectView(Icons.group_add, '添加服务', 'B'),
                this.SelectView(Icons.scanner, '扫一扫', 'C'),
              ],
              onSelected: (String action){
                switch (action) {
                  case 'A' : break;
                  case 'B' : break;
                  case 'C' : break;
                }
              },
            //弹出框偏移 最大值为导航栏的高度
            offset: Offset(0, 64),
            ),
          // ),
        ],
      ),
      body:
      // Container(
      //   child:
        new FlutterMap(
          options: MapOptions(
            // crs: epsg3413CRS,
            center: loc,
            zoom: 15.0, //默认值为：13 😊
          ),
          layers: [
            // TileLayerOptions(
            //   wmsOptions: WMSTileLayerOptions(
            //     // Set the WMS layer's CRS too
            //     // crs: epsg3413CRS,
            //     baseUrl: 'https://www.gebco.net/data_and_products/gebco_web_services/north_polar_view_wms/mapserv?',
            //     layers: ['gebco_north_polar_view'],
            //   ),
            // ),
            new TileLayerOptions(
              subdomains: ['0','1','2','3','4','5'],
              urlTemplate: 'http://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',//瓦片地图的URL
              additionalOptions: {
                'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
                'id': 'mapbox.streets',//其他附加内容
              },
            ),

            new MarkerLayerOptions(
              markers: [
                new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: loc,//经纬度注意顺序
                    builder: (ctx) =>
                      new Container(
                        child: new FlutterLogo(),
                      )
                )
              ]
            )
          ],
        )
      // ),
    );
  }

  Future openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 280.0,
            child: Column(
              //经过多次尝试：《确定每一个ListTile高度默认为: 56》
              children: <Widget>[
                ListTile(
                  title: Text('高德地图',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '高德地图');
                    MapUtil.gotoGaodeMap(loc.longitude,loc.latitude);
                    // MapUtil.gotoGaodeMap(120.21201,30.2084);
                  },

                ),
                ListTile(
                  title: Text('腾讯地图',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '腾讯地图');
                    MapUtil.gotoTencentMap(loc.longitude,loc.latitude);
                    // MapUtil.gotoTencentMap(120.21201,30.2084);
                  },
                ),
                ListTile(
                  title: Text('百度地图',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '百度地图');
                    MapUtil.gotoBaiduMap(loc.longitude,loc.latitude);
                    // MapUtil.gotoBaiduMap(120.21201,30.2084);
                  },
                ),
                ListTile(
                  title: Text('苹果地图',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '苹果地图');
                    MapUtil.gotoAppleMap(loc.longitude,loc.latitude);
                    // MapUtil.gotoAppleMap(120.21201,30.2084);
                  },
                ),
                ListTile(
                  title: Text('取消',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '取消');
                  },
                ),
              ],
            ),
          );
        }
    );

    print(option);
  }
}