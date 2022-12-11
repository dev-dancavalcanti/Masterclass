import 'package:flutter/material.dart';
import 'package:masterclass/bmi/controllers/bmi_controller.dart';
import 'package:provider/provider.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    late bool animated = false;
    final controller = context.watch<BmiController>();
    TextEditingController alturaController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              'BMI',
            ),
            const SizedBox()
          ],
        ),
        elevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                      color: controller.color,
                      borderRadius: BorderRadius.circular(animated ? 50 : 200)),
                  width: 200,
                  height: 200,
                  child: Center(child: Text(controller.result)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Altura'),
                  controller: alturaController,
                  onChanged: (value) => controller.setAltura(value),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Peso'),
                controller: pesoController,
                onChanged: (value) => controller.setPeso(value),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      controller.calcBMI();
                      animated = !animated;
                    },
                    child: Text('Calculate BMI')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
