import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget{
  @override
  State<ContainerPage> createState() => _ContainerState();
}

class _ContainerState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Container、SizedBox、AspectRatio 和 FractionallySizedBox'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text('*********** Container **********'),
            ),
            
            Container(
              child: Text('老宗'),
            ),

            Container(
              color: Colors.blue,
              child: Text('老宗'),
            ),

            Container(
              color: Colors.blue,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Text('老宗'),
              ),
            ),

            Container(
              child: Text('老宗，专心点学习Flutter'),
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),
            ),

            Container(
              child: Text('老宗，专心点学习Flutter'),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),

            Container(
              child: Text('老宗，专心点学习Flutter'),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                )
              ),
            ),

            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
                    ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                shape: BoxShape.circle,

              ),
            ),

            Container(
              color: Colors.blue,
              child: Text('老宗，专心点学习Flutter'),
              alignment: Alignment.center,
            ),

            Container(
              alignment: Alignment(-0.5,-0.5),
              child: Text('宗，专心点学习Flutter'),
            ),

            Container(
              color: Colors.blue,
              child: Text('宗，专心点学习Flutter'),
              alignment: Alignment.center,
              height: 60,
              width: 300,
            ),

            Container(
              color: Colors.blue,
              child: Text('宗，专心点学习Flutter'),
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 300,
                minHeight: 100,
                minWidth: 100,
              ),
            ),

            Container(
              color: Colors.blue,
              child: Text('宗，专心点学习Flutter'),
              alignment: Alignment.center,
              height: 60,
              width: 230,
              transform: Matrix4.rotationZ(0.5),
            ),

            Container(
              child: Text('*********** SizedBox **********'),
            ),

            Container(
              padding: EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 50,
                width: 200,
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('老宗，专心点学习Flutter技术应用'),
                ),
              ),
            ),
            
            Container(
              width: 200,
              height: 60,
              child: SizedBox.expand(
                child: Text('老宗，专心点学习Flutter技术应用'),
              ),
            ),

            Column(
              children: [
                Container(
                  height: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 20,),
                Container(
                  height: 30,
                  color: Colors.red,
                ),
              ],
            ),

            Container(
              child: Text('*********** AspectRatio **********'),
            ),

            Container(
              height: 300,
              width: 300,
              color: Colors.blue,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

            Container(
              child: Text('*********** FractionallySizedBox **********'),
            ),

            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.3,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.3,
                alignment: Alignment.centerRight, // 默认居中
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),


          ],
        ),
      )

    );
  }
}