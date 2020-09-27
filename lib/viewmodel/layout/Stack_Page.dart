import 'package:flutter/material.dart';

class StackPage extends StatefulWidget{
  @override
  State<StackPage> createState() => _StackState();
}

class _StackState extends State<StackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      color: Colors.green,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                width: 150,
                height: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      color: Colors.green,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),

              Container(
                width: 150,
                  height: 150,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        color: Colors.green,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
              ),

              Container(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        color: Colors.green,
                      ),
                      Positioned(
                        left: 10,
                        right: 20,
                        top: 20,
                        bottom: 40,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
              ),

              SizedBox(height: 20,),

              Container(
                width: 150,
                height: 150,
                child: Stack(
                  overflow: Overflow.visible, // 默认是clip：裁剪；visible:不裁剪
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Positioned(
                      left: 50,
                      top: 50,
                      width: 80,
                      height: 80,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  SizedBox(height: 20,),
                  _buildIndexedStack(),
                  SizedBox(height: 30,),
                  _buildRow(),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  _buildIndexedStack(){
    return IndexedStack(
      index: _index,
      children: [
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),

        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.green,
            alignment: Alignment.center,
            child: Icon(
              Icons.cake,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),

        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  _buildRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(
              Icons.fastfood
            ),
            onPressed: (){
              setState(() {
                _index = 0;
              });
            }
        ),

        IconButton(
            icon: Icon(
                Icons.cake
            ),
            onPressed: (){
              setState(() {
                _index = 1;
              });
            }
        ),

        IconButton(
            icon: Icon(
                Icons.local_cafe
            ),
            onPressed: (){
              setState(() {
                _index = 2;
              });
            }
        ),
      ],
    );
  }




}