import 'package:masterclass/app/utils/models/repository_model.dart';

abstract class IHttpsClient {
  Future<List<RepositoryModel>> getRepositories() async {
    return [];
  }
}
