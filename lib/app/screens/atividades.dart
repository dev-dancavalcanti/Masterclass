import 'package:flutter/material.dart';
import 'package:masterclass/app/utils/widgets/my_card.dart';

import '../utils/maps/map_get_cards.dart';

class Atividades extends StatelessWidget {
  const Atividades({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 7;
    return Scaffold(
      body: ListView.builder(
          itemCount: index,
          itemBuilder: (context, index) {
            return MyCard(
              url: getCards(index)["url"],
              stringMap: getCards(index)["stringMap"],
              onTap: getCards(index)["onTap"],
              icon: getCards(index)["icon"],
              iconSize: getCards(index)["iconSize"],
              description: getCards(index)["description"],
              number: getCards(index)["number"],
              title: getCards(index)["title"],
            );
          }),
    );
  }
}
