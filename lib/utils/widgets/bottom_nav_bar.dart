import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.setIndex, required this.onDestinationSelected});
  final int setIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    int index = setIndex;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          elevation: 0,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          indicatorColor: Theme.of(context).cardColor),
      child: NavigationBar(
        elevation: 0,
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: 70,
        selectedIndex: index,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home/target.svg',
                color: Theme.of(context).highlightColor,
              ),
              label: 'Atividades'),
          NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home/github.svg',
                color: Theme.of(context).highlightColor,
              ),
              label: 'Repositorio'),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: Theme.of(context).highlightColor,
              ),
              label: 'Sobre o Dev'),
        ],
      ),
    );
  }
}
