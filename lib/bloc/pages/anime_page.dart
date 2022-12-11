import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass/bloc/blocs/anime_bloc.dart';
import 'package:masterclass/bloc/utils/components/card_animes.dart';
import 'package:masterclass/bloc/blocs/anime_events.dart';

import 'package:shimmer/shimmer.dart';

import '../blocs/anime_state.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  late AnimeBloc bloc;
  final ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bloc = context.read<AnimeBloc>();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        bloc.add(ScrollInfinitAnimeEvent());
      }
    });
    bloc.add(FetchAnimeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new)),
              const Text(
                'Anime News',
              ),
              const SizedBox()
            ],
          ),
          elevation: 0,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: BlocBuilder<AnimeBloc, AnimeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ExceptionAnimeState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bloc_animes/anya1.png',
                        width: 250,
                        height: 250,
                        scale: .6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Ooops!',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Text(
                        'Algo nao deu muito certo. Vamos tentar novamente?',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            const Duration(seconds: 5);
                            bloc.add(FetchAnimeEvent());
                          },
                          child: const Text('Tentar Novamente'))
                    ],
                  ),
                );
              }

              if (state is LoadingAnimeState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bloc_animes/anya.png',
                        height: 200,
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                            'Aguarde um instante \n Estamos carregando as noticias ...',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      CircularProgressIndicator(
                        color: Theme.of(context).highlightColor,
                      )
                    ],
                  ),
                );
              }

              if (state is SucessAnimeState) {
                final animes = state.models;
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ListView.builder(
                      itemCount: animes.length + 1,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index < animes.length) {
                          return CardAnime(
                            imageURL: animes[index].imageURL,
                            title: animes[index].title,
                            url: animes[index].url,
                          );
                        } else {
                          return const CardShimmer();
                        }
                      },
                    ),
                  ],
                );
              } else {
                return Container();
              }
            }));
  }
}
