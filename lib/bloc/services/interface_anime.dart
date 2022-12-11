import 'package:masterclass/bloc/models/anime_model.dart';

abstract class IClienteAnime {
  Future<List<AnimeModel>> getToDos(int page) async {
    return [];
  }
}
