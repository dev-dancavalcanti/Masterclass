import 'package:flutter/material.dart';
import 'package:masterclass/controllers/app_controller.dart';
import 'package:masterclass/utils/components/app_bar.dart';
import 'package:provider/provider.dart';

class PageListAtividades extends StatelessWidget {
  const PageListAtividades({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();
    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: myAppBar(
            context,
            mapAtividades()[controller.mapAtividades][0]["titleApp"] ?? '',
            controller.toogleTheme,
            Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).highlightColor,
            )),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: mapAtividades()[controller.mapAtividades].length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              mapAtividades()[controller.mapAtividades][index]
                                  ["onTap"]);
                        },
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Theme.of(context).cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "${mapAtividades()[controller.mapAtividades][index]["number"]}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    mapAtividades()[controller.mapAtividades]
                                        [index]["title"],
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  )
                                ],
                              ),
                            )),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> mapAtividades() {
  return {
    "mockup": [
      {
        "titleApp": "Mockups",
        "title": "Tinder",
        "number": 1,
        "onTap": "/tinder"
      },
      {"title": "Under Control", "number": 2, "onTap": "/underControl"},
    ],
    "animacao": [
      {
        "titleApp": "Animacao",
        "title": "Button Animation Explicit ",
        "number": 1,
        "onTap": "/buttonExp"
      },
      {"title": "Tile Animation Explicit", "number": 2, "onTap": "/tileExp"},
      {
        "title": "Button Animation Implicit",
        "number": 3,
        "onTap": "/buttonImp"
      },
      {"title": "Tile Animation Implicit", "number": 4, "onTap": "/tileImp"},
    ],
    "cpf": [
      {
        "titleApp": "CPF",
        "title": "CPF Validator",
        "number": 1,
        "onTap": "/cpfValidator"
      },
    ]
  };
}
