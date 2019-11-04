import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.cardIcon, @required this.cardText});

  final String cardText;
  final IconData cardIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kFeMaleTextStyle,
        )
      ],
    );
  }
}
