import 'package:flutter/material.dart';
import 'input_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.mycolor, this.cardContent, this.onPress});

  final Color mycolor;
  final Widget cardContent;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: cardContent,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: mycolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
