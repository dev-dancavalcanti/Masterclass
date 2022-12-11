import '../models/anime_model.dart';

abstract class AnimeState {}

class InicialAnimeState extends AnimeState {}

class LoadingAnimeState extends AnimeState {}

class ExceptionAnimeState extends AnimeState {
  final String message;
  final StackTrace? stackTrace;
  ExceptionAnimeState(this.message, [this.stackTrace]);
}

class SucessAnimeState extends AnimeState {
  final List<AnimeModel> models;
  SucessAnimeState(this.models);
}

class LoadedState extends AnimeState {}
