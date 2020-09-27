import 'package:flutter/material.dart';

class FlexiblePage extends StatefulWidget{
  @override
  State<FlexiblePage> createState() => _FlexibleState();
}

class _FlexibleState extends State<FlexiblePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded、Flexible 和 Spacer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text('*********** Flexible **********'),
            ),

            Row(
              children: [
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                ),

                Flexible(
                    child: Container(
                      color: Colors.red,
                      height: 50,
                    )
                ),

                Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                ),

                Flexible(
                    child: OutlineButton(
                      child: Text('OutlineButton'),
                    )
                ),

                Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                ),
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                  ),
                  flex: 1,
                ),

                Flexible(
                  child: Container(
                    height: 30,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                  ),
                  flex: 2,
                ),

                Flexible(
                  child: Container(
                    height: 30,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
                  ),
                  flex: 3,
                ),
              ],
            ),

            Container(
              child: Text('*********** Expanded **********'),
            ),

            Row(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                ),
                Expanded(
                  child: OutlineButton(
                    child: Text('OutlineButton'),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                ),
              ],
            ),

            Container(
              child: Text('*********** Spacer **********'),
            ),

            Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                ),
                Spacer(flex: 2,),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ),
                Spacer(),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),

            Container(
              child: Text('总结：三个权重组建总结如下：\nSpacer 是通过 Expanded 实现的，Expanded继承自Flexible。\n填满剩余空间直接使用Expanded更方便。\nSpacer 用于撑开 Row、Column、Flex 的子组件的空隙。'),
            ),

          ],
        ),
      ),
    );
  }
}