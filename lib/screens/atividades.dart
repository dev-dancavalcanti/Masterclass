import 'package:flutter/material.dart';
import 'package:masterclass/utils/widgets/my_card.dart';

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

Map<String, dynamic> getCards(
  int index,
) {
  switch (index) {
    case 0:
      return {
        "icon": "assets/icons/home/running.svg",
        "iconSize": 25.0,
        "title": "Animações",
        "description":
            "Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos",
        "number": 4,
        "onTap": "/pageList",
        "stringMap": "animacao"
      };
    case 1:
      return {
        "icon": "assets/icons/home/glasses.svg",
        "iconSize": 30.0,
        "title": "Leitura de Mockup",
        "description":
            "Aplicação da técnica de leitura de mockup, contendo 2 exercícios",
        "number": 2,
        "onTap": "/pageList",
        "stringMap": "mockup"
      };
    case 2:
      return {
        "icon": "assets/icons/home/toys.svg",
        "iconSize": 30.0,
        "title": "Playground",
        "description": "Ambiente destinado a testes e estudos em geral",
        "number": 1,
        "onTap": "/play",
      };
    case 3:
      return {
        "icon": "assets/icons/home/bmi.svg",
        "iconSize": 20.0,
        "title": "IMC",
        "description": "Calculo de IMC",
        "number": 1,
        "onTap": "/bmi"
      };
    case 4:
      return {
        "icon": "assets/icons/home/cpf.svg",
        "iconSize": 40.0,
        "title": "CPF",
        "description": "Validador de CPF",
        "number": 1,
        "onTap": "/pageList",
        "stringMap": "cpf"
      };
    case 5:
      return {
        "icon": "assets/icons/home/todo.svg",
        "iconSize": 30.0,
        "title": "TODO",
        "description": "Consumo de API Todos",
        "number": 1,
        "onTap": "/todo"
      };
    case 6:
      return {
        "icon": "assets/icons/home/todo.svg",
        "iconSize": 30.0,
        "title": "BloC",
        "description": "Uso de BloC, consumo de API e scroll infinito",
        "number": 1,
        "onTap": "/anime"
      };

    default:
      return {};
  }
}
