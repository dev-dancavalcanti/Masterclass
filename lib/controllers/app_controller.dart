import 'package:flutter/material.dart';
import 'package:masterclass/repositorys/interface_cliente.dart';
import 'package:masterclass/utils/models/repository_model.dart';

class AppController extends ChangeNotifier {
  final IHttpsClient _service;
  AppController(this._service) {
    fetchRepositories();
  }

  ThemeMode theme = ThemeMode.dark;
  String mapAtividades = '';
  int setIndex = 0;

  List<RepositoryModel> repositoriesList = [];
  bool isLoading = false;

  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchRepositories() async {
    try {
      toggleLoading();
      repositoriesList = await _service.getRepositories();
      toggleLoading();
    } catch (e) {}
  }

  void changeIndex(int value) {
    toggleLoading();
    setIndex = value;
    toggleLoading();
  }

  void toogleTheme() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
    notifyListeners();
  }
}
