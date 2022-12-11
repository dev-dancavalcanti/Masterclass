import 'package:flutter/material.dart';

import '../models/cpf_model.dart';

class CpfController extends ChangeNotifier {
  bool? validator;
  TextEditingController cpfTextEdit = TextEditingController();

  Future<bool> cpfValidator(value) async {
    CpfModel cpfValidator = CpfModel();
    bool result = await cpfValidator.isValid(value);
    validator = result;
    notifyListeners();
    return validator!;
  }
}
