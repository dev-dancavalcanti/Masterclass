import 'package:flutter/material.dart';

class RepositoryEmpty extends StatelessWidget {
  const RepositoryEmpty({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            'assets/images/home/githubb-rpng.png',
            width: 400,
          ),
        ),
        Text(
          'Ooops, sorry!',
          style: Theme.of(context).textTheme.headline1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'I don\'t have any repository at the moment!',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        ElevatedButton(onPressed: onPressed, child: const Text('Refresh'))
      ],
    );
  }
}
