import 'package:flutter/material.dart';
import '../constants.dart';

class Bottombar extends StatelessWidget {
  Bottombar({@required this.statement, @required this.onTap});

  final String statement;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          statement,
          style: kFeMaleTextStyle,
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomCardColor,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
