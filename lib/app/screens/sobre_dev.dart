import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterclass/app/controllers/url_controller.dart';
import 'package:provider/provider.dart';

class SobreDev extends StatelessWidget {
  const SobreDev({super.key});

  @override
  Widget build(BuildContext context) {
    final UrlController urlController = context.watch<UrlController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 85),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: ClipOval(
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/about/eu.jpg",
                                    scale: .6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Daniel Lucas',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Text(
                          'Olá, meu nome é Daniel, tenho 26 anos e estou estudando Flutter, apredendo com desejo de me tornar um Dev Jr.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    urlController.launchWhatsApp();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/about/wpp.svg',
                                    color: Theme.of(context).highlightColor,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    urlController.launchHttps(
                                        "github.com", "dev-dancavalcanti");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/about/gh.svg',
                                    color: Theme.of(context).highlightColor,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    urlController.launchHttps(
                                        "instagram.com", "danielwiins");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/about/ig.svg',
                                    color: Theme.of(context).highlightColor,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    urlController.launchHttps(
                                        "facebook.com", "daniel.lucas.96/");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/about/fb.svg',
                                    color: Theme.of(context).highlightColor,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Tecnologias Favoritas',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/about/flutter.svg',
                                width: 30,
                                color: Theme.of(context).highlightColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Flutter',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Habilidades e Competencias',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      SkillWidget(
                        title: 'Dart/Flutter',
                        value: 0.5,
                      ),
                      SkillWidget(
                        title: 'Dart/Flutter',
                        value: 0.5,
                      ),
                      SkillWidget(
                        title: 'Dart/Flutter',
                        value: 0.5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  const SkillWidget({super.key, required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: ClipRRect(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(500)),
                width: 100,
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    value: value,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
