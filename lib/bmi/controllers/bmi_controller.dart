import 'package:flutter/material.dart';

import 'package:masterclass/bmi/models/person_model.dart';

class BmiController extends ChangeNotifier {
  String result = '';
  Person _model = Person.empty();
  double bmi = 0;
  Color? color;
  String value = '';

  void setAltura(String text) {
    final altura = double.tryParse(text) ?? 0;
    _model = _model.copyWith(altura: altura);
  }

  void setPeso(String text) {
    final peso = double.tryParse(text) ?? 0;
    _model = _model.copyWith(peso: peso);
  }

  void calcBMI() {
    bmi = _model.getBMI();

    if (bmi < 18) {
      result = "IMC : ${bmi.toStringAsFixed(2)} - Abaixo do peso";
      color = Colors.blue;
    } else if (bmi < 25) {
      result = "IMC : ${bmi.toStringAsFixed(2)} - Peso Ideal";
      color = Colors.green;
    } else {
      result = "IMC : ${bmi.toStringAsFixed(2)} - A cima do peso";
      color = Colors.red;
    }
    notifyListeners();
  }
}
