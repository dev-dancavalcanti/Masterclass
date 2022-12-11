import 'package:dio/dio.dart';
import 'package:masterclass/repositorys/interface_cliente.dart';
import 'package:masterclass/utils/models/repository_model.dart';
import 'package:uno/uno.dart';

class RepositoriesService implements IHttpsClient {
  final Dio _uno;
  RepositoriesService(this._uno);

  @override
  Future<List<RepositoryModel>> getRepositories() async {
    final response =
        await _uno.get("https://api.github.com/users/dev-dancavalcanti/repos");
    final list = response.data as List;
    return list.map((e) => RepositoryModel.fromMap(e)).toList();
  }
}
