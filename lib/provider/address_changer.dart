import 'package:flutter/material.dart';

class AddressChanger with ChangeNotifier{

  int _counter = 0;
  int get count => _counter;

  displayCounter(dynamic newValue){
    _counter = newValue;
    notifyListeners();
  }
}