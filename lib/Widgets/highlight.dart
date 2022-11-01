import 'package:flutter/material.dart';

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
          width: 400,
          image: NetworkImage(
              url),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              print('oi');
            },
            child: Text('Assista Agora'),
          ),
        ),
      ],
    );
  }
}
