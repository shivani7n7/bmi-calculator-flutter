import 'package:bmi_calculator/Components/round_icon_button_main_page.dart';
import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/card_icon.dart';
import '../constants.dart';
import '../Components/botttom_bar.dart';
import 'result_page.dart';
import 'package:bmi_calculator/main_logic.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;
  int heightData = 140;
  int weightData = 60;
  int ageData = 20;

  // 0 - male , 1 - female
//  void updateCardColor(Gender g) {
//    if (g == Gender.male) {
//      if (maleCardColor == inactiveCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      } else
//        maleCardColor = inactiveCardColor;
//    } else {
//      if (femaleCardColor == inactiveCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      } else
//        femaleCardColor = inactiveCardColor;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    mycolor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardContent: IconContent(
                        cardIcon: FontAwesomeIcons.male, cardText: 'MALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    mycolor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardContent: IconContent(
                      cardIcon: FontAwesomeIcons.female,
                      cardText: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              mycolor: Color(0xFF1D1E33),
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kFeMaleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightData.toString(),
                        style: kLabelTextStyle,
                      ),
                      Text('Cm', style: kFeMaleTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E80),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                    ),
                    child: Slider(
                      value: heightData.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightData = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    mycolor: Color(0xFF1D1E33),
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kFeMaleTextStyle,
                        ),
                        Text(
                          weightData.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              plusMinusIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(
                                  () {
                                    weightData--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              plusMinusIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(
                                  () {
                                    weightData++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    mycolor: Color(0xFF1D1E33),
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kFeMaleTextStyle,
                        ),
                        Text(
                          ageData.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              plusMinusIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(
                                  () {
                                    ageData--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              plusMinusIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(
                                  () {
                                    ageData++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombar(
            statement: 'CALCULATE',
            onTap: () {
              MainLogic ml = MainLogic(weight: weightData, height: heightData);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: ml.getBmi(),
                    review: ml.getReview(),
                    remark: ml.getRemark(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
