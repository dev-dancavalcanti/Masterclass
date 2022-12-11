import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass/animation/pages/button_explicit_page.dart';
import 'package:masterclass/animation/pages/button_implicit_page.dart';
import 'package:masterclass/animation/pages/tile_explicit_page.dart';
import 'package:masterclass/animation/pages/tile_implicit_page.dart';
import 'package:masterclass/bloc/blocs/anime_bloc.dart';
import 'package:masterclass/bloc/pages/anime_page.dart';
import 'package:masterclass/bloc/services/interface_anime.dart';
import 'package:masterclass/bmi/controllers/bmi_controller.dart';
import 'package:masterclass/bmi/pages/bmi_page.dart';
import 'package:masterclass/app/controllers/app_controller.dart';
import 'package:masterclass/cpf/controllers/cpf_controller.dart';
import 'package:masterclass/cpf/pages/cpf_validator_page.dart';
import 'package:masterclass/playgroud/play_page.dart';
import 'package:masterclass/repositorys/dio_repository.dart';
import 'package:masterclass/repositorys/interface_cliente.dart';
import 'package:masterclass/app/screens/homepage.dart';
import 'package:masterclass/app/screens/page_with_ativi.dart';
import 'package:masterclass/todos/controllers/todo_controller.dart';
import 'package:masterclass/todos/repositories/todo_repository.dart';
import 'package:masterclass/todos/screens/todo_page.dart';
import 'package:masterclass/app/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'bloc/repositories/anime_repositories.dart';
import 'app/controllers/url_controller.dart';
import 'mockups/pages/tinder.dart';
import 'mockups/pages/under_control.dart';
import 'todos/service/interface_cliente_todo.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Dio()),
        Provider<Uno>(create: (context) => Uno()),
        ChangeNotifierProvider(create: (context) => CpfController()),
        Provider<UrlController>(create: (context) => UrlController()),
        ChangeNotifierProvider(create: (context) => BmiController()),
        Provider<IClienteAnime>(create: (_) => AnimeRepository(_.read<Uno>())),
        Provider<IClienteHttpsTodo>(
            create: (_) => TodoRepository(_.read<Uno>())),
        Provider<IHttpsClient>(
            create: (_) => RepositoriesService(_.read<Dio>())),
        Provider<IClienteAnime>(create: (_) => AnimeRepository(_.read<Uno>())),
        ChangeNotifierProvider(create: (_) => ToDoController(_.read())),
        ChangeNotifierProvider(create: (_) => AppController(_.read())),
        BlocProvider(create: (_) => AnimeBloc(_.read()))
      ],
      builder: (context, child) {
        final AppController controller = context.watch<AppController>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutterando Masterclass',
          themeMode: controller.theme,
          theme: LightTheme.theme,
          darkTheme: DarkTheme.theme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/pageList': (context) => const PageListAtividades(),
            '/tinder': (context) => const Tinder(),
            '/underControl': (context) => const UnderControl(),
            '/buttonExp': (context) => const ButtonAnimatedExp(),
            '/buttonImp': (context) => const ButtonAnimatedImp(),
            '/tileExp': (context) => const TileAnimationExp(),
            '/tileImp': (context) => const TileAnimationImp(),
            '/cpfValidator': (context) => const CpfValidatorPage(),
            '/todo': (context) => const ToDoPage(),
            '/bmi': (context) => const BmiPage(),
            '/anime': (context) => const AnimePage(),
            '/play': (context) => const Playground(),
          },
        );
      },
    );
  }
}
