import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass/app/utils/repositorys/dio_repository.dart';
import 'package:uno/uno.dart';

void main() {
  final service = RepositoriesService(Dio());
  test("Pegar os repositories", () async {
    final repositories = await service.getRepositories();
    return repositories;
  });
}
