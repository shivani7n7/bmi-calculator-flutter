import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../Components/botttom_bar.dart';

class Result extends StatelessWidget {
  Result({@required this.bmi, @required this.remark, @required this.review});

  final String bmi;
  final String review;
  final String remark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kYourResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              mycolor: kActiveCardColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    remark,
                    style: kRemark,
                  ),
                  Text(
                    bmi,
                    style: kBmi,
                  ),
                  Text(
                    review,
                    textAlign: TextAlign.center,
                    style: kReview,
                  ),
                ],
              ),
            ),
          ),
          Bottombar(
            statement: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
