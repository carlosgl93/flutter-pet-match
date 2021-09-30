import 'package:flutter/material.dart';
import '../config.dart';

class LikeDislikeCTAs extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
  
  final width = Config.screenWidth;
  final height = Config.screenHeight;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          // function to reject candidate
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.do_not_disturb,
              color: Colors.red,
              size: 55,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        // function to like candidate
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.favorite,
              color: Colors.green,
              size: 55,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
