import 'package:uno/uno.dart';
import '../models/anime_model.dart';
import '../services/interface_anime.dart';

class AnimeRepository implements IClienteAnime {
  final Uno uno;
  AnimeRepository(this.uno);

  @override
  Future<List<AnimeModel>> getToDos(int page) async {
    final response = await uno.get(
        'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=$page&per_page=10');
    List data = response.data as List;

    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }
}
