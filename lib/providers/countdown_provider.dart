import 'package:flutter/material.dart';

class CountdounProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 60);
  bool isRunning = false;
  //subscription

  void startStopTimer() {
    if (!isRunning) {
      _startTimer(duration.inSeconds);
    } else {
      // stop timer
    }

    isRunning = !isRunning;
    notifyListeners();
  }

  void _startTimer(int seconds) {
    Stream<int>.periodic(const Duration(seconds: 1), (sec) => seconds - sec - 1)
        .take(seconds)
        .listen((timeLeftInSeconds) {
      duration = Duration(seconds: timeLeftInSeconds);
      notifyListeners();
    });
  }

  String get timeLeftString {
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).floor();
    return '$minutes:$seconds';
  }
}
