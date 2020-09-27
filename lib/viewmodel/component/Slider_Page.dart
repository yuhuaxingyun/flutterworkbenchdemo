import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterworkbench/utils/ToolsUtil.dart';

class SliderPage extends StatefulWidget{
  @override
  State<SliderPage> createState() => _SliderState();
}

class _SliderState extends State <SliderPage> {
  @override
  double _sliderValue = 0.5; //默认值0～1
  double _sliderValue1 = 5;  // 必须在最大值和最小值内
  double _sliderValue2 = 25;
  double _sliderValue3 = 20;
  double _sliderValue4 = 40;
  RangeValues _rangeValues = RangeValues(0, 25);
  double _sliderValue5 = 0;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              width: ToolsUtil.screenWidth,
              height: 150,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('值:$_sliderValue'),
                    Slider(
                        value: _sliderValue,
                        onChanged: (value){
                          setState(() {
                            _sliderValue = value;
                          });
                        }
                    ),
                  ],
                ),
              ),
            ),

            Slider(
              value: _sliderValue1,
              label: '$_sliderValue1',
              min: 0,
              max: 100,
              onChanged: (value){
                setState(() {
                  _sliderValue1 = value;
                });
              },
            ),

            Slider(
              value: _sliderValue2,
              label: '$_sliderValue2',
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (value){
                setState(() {
                  _sliderValue2 = value;
                });
              },
            ),

            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0xff404080),
                    thumbColor: Colors.blue,
                    overlayColor: Colors.green,
                    valueIndicatorColor: Colors.purpleAccent
                ),
                child: Slider(
                  value: _sliderValue3,
                  label: '$_sliderValue3',
                  min: 0,
                  max: 100,
                  divisions: 5,
                  onChanged: (value){
                    setState(() {
                      _sliderValue3 = value;
                    });
                  },
                ),
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: _sliderValue4,
                label: '$_sliderValue4',
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (value){
                  setState(() {
                    _sliderValue4 = value;
                  });
                },
              ),
            ),

            RangeSlider(
                values: _rangeValues,
                labels: RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
                min: 0,
                max: 100,
                divisions: 4,
                onChanged: (value){
                  setState(() {
                    _rangeValues = value;
                  });
                },
            ),

            /// iOS 滑块
            CupertinoSlider(
              value: _sliderValue5,
              onChanged: (value){
                setState(() {
                  _sliderValue5 = value;
                });
              },
            ),

          ],
        ),
      )

    );
  }
}