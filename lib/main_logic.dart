import 'package:flutter/cupertino.dart';
import 'dart:math';

class MainLogic {
  MainLogic({@required this.weight, @required this.height});

  final int weight;
  final int height;
  double _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getRemark() {
    if (_bmi > 25)
      return 'OVERWEIGHT';
    else if (_bmi < 18.5)
      return 'UNDERWEIGHT';
    else
      return 'NORMAL';
  }

  String getReview() {
    if (_bmi > 25)
      return 'You have higher bmi than normal range,try to exercise more';
    else if (_bmi < 18.5)
      return 'You have lower bmi than normal range,try to eat more';
    else
      return 'You are in Normal range.. HURRAY';
  }
}
