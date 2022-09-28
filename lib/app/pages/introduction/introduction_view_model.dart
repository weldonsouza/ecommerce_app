
import 'package:flutter/material.dart';

class IntroductionProviderController with ChangeNotifier {
  int currentStep = 0;

  setCurrentStep(int value) {
    currentStep = value;
    notifyListeners();
  }
}
