import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class loadVideoScreen extends StatefulWidget {
  const loadVideoScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<loadVideoScreen> createState() => _loadVideoScreenState();
}

class _loadVideoScreenState extends State<loadVideoScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.black87,),
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            YoutubePlayer(controller: YoutubePlayerController(
              initialVideoId: widget.url,
            ))
          ],
        ),
      ),
    );
  }
}
