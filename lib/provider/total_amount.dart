import 'package:flutter/material.dart';

class TotalAmount with ChangeNotifier {
  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

  displayTotalAmount(double number) async {
    _totalAmount = number;

    await Future.delayed(const Duration(milliseconds: 100),
            () {
      notifyListeners();
    });
  }
}
