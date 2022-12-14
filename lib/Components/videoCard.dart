import 'package:challange_mobile_alura/Screens/loadVideoScreen.dart';
import 'package:flutter/material.dart';


class videoCard extends StatefulWidget {
  final String url;
  final String categorieName;
  final int categorieColor;

  const videoCard(
      {Key? key,
      required this.url,
      required this.categorieName,
      required this.categorieColor})
      : super(key: key);

  @override
  State<videoCard> createState() => _videoCardState();
}

class _videoCardState extends State<videoCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(widget.categorieColor)),
            child: Text(widget.categorieName,
                style: const TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  child: Image.network(
                      'https://img.youtube.com/vi/${widget.url}/maxresdefault.jpg'),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextBuilder) => loadVideoScreen(url: widget.url),
                      )
                    );
                  }
                )),
          ),
        ],
      ),
    );
  }
}
