import 'package:flutter/material.dart';
import 'package:ice_live_viewer/widgets/huyadanmaku.dart';

class StreamPlayer extends StatefulWidget {
  const StreamPlayer(
      {Key? key,
      required this.title,
      required this.url,
      required this.danmakuId})
      : super(key: key);

  final String title;
  final String url;
  final int danmakuId;
  @override
  State<StreamPlayer> createState() => _StreamPlayerState();
}

class _StreamPlayerState extends State<StreamPlayer> {
  @override
  Widget build(BuildContext context) {
    final ratio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    final nativeVideo = Container();
    var huyaDanmakuListView = HuyaDanmakuListView(
      danmakuId: widget.danmakuId,
    );
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.title),
        ),
        body: ratio > 1.2
            ? Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: nativeVideo,
                  ),
                  Expanded(
                    flex: 1,
                    child: huyaDanmakuListView,
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: nativeVideo,
                  ),
                  Expanded(
                    flex: 5,
                    child: HuyaDanmakuListView(
                      danmakuId: widget.danmakuId,
                    ),
                  ),
                ],
              ));
  }
}
