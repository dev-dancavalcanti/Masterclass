import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new)),
            const Text(
              'Playground',
            ),
            const SizedBox()
          ],
        ),
        elevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: const Center(child: Text('Parquinho Fechado para Reformas')),
    );
  }
}
