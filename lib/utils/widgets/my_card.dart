import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterclass/controllers/app_controller.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      this.stringMap,
      required this.onTap,
      required this.number,
      required this.title,
      required this.description,
      required this.icon,
      required this.iconSize});

  final String? stringMap;
  final int number;
  final String onTap;
  final String title;
  final String description;
  final String icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: SvgPicture.asset(
                      icon,
                      width: iconSize,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Atividades:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    ' $number',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 7,
                  height: 35,
                  child: Center(
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                      style: ButtonStyle(
                          maximumSize:
                              MaterialStateProperty.all(const Size(200, 36)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/home/github.svg',
                        color: Theme.of(context).highlightColor,
                      ),
                      label: Text(
                        'Acessar codigo fonte',
                        style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).highlightColor),
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        elevation: MaterialStateProperty.all(0),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      Navigator.pushNamed(context, onTap);
                      controller.mapAtividades = stringMap ?? '';
                    },
                    child: const Text(
                      'Ver mais',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
