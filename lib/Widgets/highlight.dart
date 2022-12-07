import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class highlight extends StatelessWidget {
  final String url;

  const highlight({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          fit: BoxFit.cover,
          height: 140,
          width: double.maxFinite,
          image: NetworkImage('https://img.youtube.com/vi/${url}/maxresdefault.jpg'),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {
              launchUrl(Uri.parse('https://m.youtube.com/watch?v=${url}'));
            },
            child: Text('Assista Agora'),
          ),
        ),
      ],
    );
  }
}
