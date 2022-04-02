import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligiblityMessage = "";

  void checkEligiblity(int age) {
    if (age >= 18) {
      isEligible = true;
      eligiblityMessage = "You are eligible.";
    } else {
      isEligible = false;
      eligiblityMessage = "You are not eligible.";
    }
    notifyListeners();
  }
}
