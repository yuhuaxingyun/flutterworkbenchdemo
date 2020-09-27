import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  var _title;

  VideoPlayer(this._title);

  @override
  _VideoPlayerState createState() => _VideoPlayerState(_title);
}

class _VideoPlayerState extends State<VideoPlayer> {
  var _title;

  _VideoPlayerState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Container(

        )
    );
  }
}
