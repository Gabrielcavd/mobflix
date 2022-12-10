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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'MOBFLIX',
          style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Container(
          color: Colors.black87,
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(initialVideoId: widget.url),
            ),
            builder: (context, player) {
              return Column(
                children: [
                  player,
                ],
              );
            },
          )),
    );
  }
}
