import 'package:dio/dio.dart';
import 'package:masterclass/repositorys/interface_cliente.dart';
import 'package:masterclass/app/utils/models/repository_model.dart';

class RepositoriesService implements IHttpsClient {
  final Dio _dio;
  RepositoriesService(this._dio);

  @override
  Future<List<RepositoryModel>> getRepositories() async {
    final response =
        await _dio.get("https://api.github.com/users/dev-dancavalcanti/repos");
    final list = response.data as List;
    return list.map((e) => RepositoryModel.fromMap(e)).toList();
  }
}
