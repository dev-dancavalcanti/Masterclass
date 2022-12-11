import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cpf_controller.dart';

class CpfValidatorPage extends StatelessWidget {
  const CpfValidatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CpfController cpfController = context.watch<CpfController>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  cpfController.cpfTextEdit.clear();
                  cpfController.validator = null;
                },
                child: const Icon(Icons.arrow_back_ios_new))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: TextFormField(
                controller: cpfController.cpfTextEdit,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'CPF'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await cpfController
                    .cpfValidator(cpfController.cpfTextEdit.value.text);
              },
              child: const Text('Validar'),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ChangeNotifierProvider.value(
                  value: cpfController,
                  builder: (context, child) {
                    if (cpfController.validator == null) {
                      return const Text('');
                    } else {
                      return cpfController.validator!
                          ? const Text('Valido')
                          : const Text('Invalido');
                    }
                  },
                ))
          ]),
        ));
  }
}
