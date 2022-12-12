import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterclass/app/controllers/app_controller.dart';
import 'package:masterclass/app/controllers/url_controller.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/repository_empty.dart';

class Repositorio extends StatelessWidget {
  const Repositorio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();
    final urlController = context.watch<UrlController>();
    return Scaffold(
        body: ChangeNotifierProvider.value(
            value: controller,
            builder: (context, child) {
              if (controller.repositoriesList.isEmpty) {
                return controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).highlightColor,
                        ),
                      )
                    : RepositoryEmpty(
                        onPressed: () {
                          controller.fetchRepositories();
                        },
                      );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).highlightColor,
                              ),
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                displacement: 60.0,
                                edgeOffset: 40,
                                onRefresh: () async {
                                  await controller.fetchRepositories();
                                },
                                child: ListView.builder(
                                    itemCount:
                                        controller.repositoriesList.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          color: Theme.of(context).cardColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Text(
                                                    controller
                                                        .repositoriesList[index]
                                                        .name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Text(
                                                    controller
                                                            .repositoriesList[
                                                                index]
                                                            .description ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: TextButton.icon(
                                                          style: ButtonStyle(
                                                              maximumSize:
                                                                  MaterialStateProperty.all(
                                                                      const Size(
                                                                          200,
                                                                          36)),
                                                              foregroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .white),
                                                              overlayColor:
                                                                  MaterialStateProperty.all(Colors
                                                                      .transparent),
                                                              backgroundColor:
                                                                  MaterialStateProperty.all(
                                                                      Colors.transparent)),
                                                          onPressed: () {
                                                            urlController
                                                                .launchHttpsRepositorie(
                                                                    controller
                                                                        .repositoriesList[
                                                                            index]
                                                                        .url);
                                                          },
                                                          icon: SvgPicture.asset(
                                                            'assets/icons/home/github.svg',
                                                            color: Theme.of(
                                                                    context)
                                                                .highlightColor,
                                                          ),
                                                          label: Text(
                                                            'Codigo fonte',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Theme.of(
                                                                        context)
                                                                    .highlightColor),
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                    }),
                              ),
                            )
                    ],
                  ),
                );
              }
            }));
  }
}