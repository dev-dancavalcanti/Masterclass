import 'package:flutter/material.dart';

import 'package:masterclass/controllers/url_controller.dart';
import 'package:provider/provider.dart';

class CardAnime extends StatelessWidget {
  const CardAnime(
      {super.key,
      required this.url,
      required this.title,
      required this.imageURL});

  final String url;
  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    final urlController = context.watch<UrlController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          urlController.launchHttpsRepositorie(url);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).cardColor,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageURL,
                  width: MediaQuery.of(context).size.width * .92,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          color: Theme.of(context).cardColor,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .92,
                  height: 90,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
