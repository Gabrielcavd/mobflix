import 'package:challange_mobile_alura/Widgets/videoCardData.dart';
import 'package:flutter/material.dart';


class rowVideoCard extends StatelessWidget {
   const rowVideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: videoCardInherited.of(context).videoList,
      ),
    );
  }
}
