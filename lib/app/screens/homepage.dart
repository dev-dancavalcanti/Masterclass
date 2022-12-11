import 'package:flutter/material.dart';
import 'package:masterclass/app/controllers/app_controller.dart';
import 'package:masterclass/app/screens/repositorio.dart';
import 'package:masterclass/app/screens/sobre_dev.dart';
import 'package:masterclass/app/utils/components/app_bar.dart';
import 'package:provider/provider.dart';
import '../utils/widgets/bottom_nav_bar.dart';
import 'atividades.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = const [
    Atividades(),
    Repositorio(),
    SobreDev(),
  ];

  final titles = [
    'Atividades',
    'Repositorio',
    'Sobre o Dev',
  ];

  @override
  Widget build(BuildContext context) {
    AppController controller = context.watch<AppController>();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: myAppBar(
          context,
          titles[controller.setIndex],
          controller.toogleTheme,
        ),
        body: pages[controller.setIndex],
        bottomNavigationBar: BottomNavBar(
            setIndex: controller.setIndex,
            onDestinationSelected: (value) {
              controller.changeIndex(value);
            }));
  }
}
