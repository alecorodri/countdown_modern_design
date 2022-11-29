import 'package:flutter/material.dart';

class CountdounProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 75);
  bool isRunning = false;
  //subscription

  void startStopTimer() {
    if (!isRunning) {
      // _startTimer();
    } else {
      // stop timer
    }

    isRunning = !isRunning;
    notifyListeners();
  }
}
