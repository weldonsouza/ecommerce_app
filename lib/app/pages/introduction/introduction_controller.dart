
import 'package:flutter/material.dart';

class IntroductionController with ChangeNotifier {
  int currentStep = 0;

  setCurrentStep(int value) {
    currentStep = value;
    notifyListeners();
  }
}
