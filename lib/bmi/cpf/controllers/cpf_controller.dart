import 'package:flutter/material.dart';

import '../models/cpf_model.dart';

class CpfController extends ChangeNotifier {
  bool? validator;
  TextEditingController cpfTextEdit = TextEditingController();

  Future<void> cpfValidator(value) async {
    CpfModel cpfValidator = CpfModel();
    validator = await cpfValidator.isValid(value);
    notifyListeners();
  }
}
