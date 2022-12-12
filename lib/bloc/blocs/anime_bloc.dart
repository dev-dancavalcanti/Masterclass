import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass/bloc/blocs/anime_events.dart';
import 'package:masterclass/bloc/services/interface_anime.dart';
import '../models/anime_model.dart';
import 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final IClienteAnime repository;

  AnimeBloc(this.repository) : super(InicialAnimeState()) {
    on<FetchAnimeEvent>(_fetchAnimed);
    on<ScrollInfinitAnimeEvent>(infinityScroll);
  }
  int page = 1;
  List<AnimeModel> animes = [];

  Future<void> _fetchAnimed(event, emit) async {
    emit(LoadingAnimeState());
    try {
      page = 1;
      animes = await repository.getToDos(page);
      emit(SucessAnimeState(animes));
    } catch (e, s) {
      emit(ExceptionAnimeState(e.toString(), s));
    }
  }

  Future<void> infinityScroll(event, emit) async {
    try {
      page++;
      List<AnimeModel> newAnimes = await repository.getToDos(page);
      animes.addAll(newAnimes);

      emit(SucessAnimeState(animes));
    } catch (e, s) {
      emit(ExceptionAnimeState(e.toString(), s));
    }
  }
}
