import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass/bloc/blocs/anime_bloc.dart';
import 'package:masterclass/bloc/events/anime_events.dart';
import 'package:masterclass/bloc/repositories/anime_repositories.dart';
import 'package:masterclass/bloc/states/anime_state.dart';
import 'package:uno/uno.dart';

void main() {
  blocTest('Deve retornar lista de animes',
      build: () => AnimeBloc(AnimeRepository(Uno())),
      act: (bloc) => bloc.add(FetchAnimeEvent()),
      wait: const Duration(seconds: 3),
      expect: () => [isA<LoadingAnimeState>(), isA<SucessAnimeState>()]);
}
