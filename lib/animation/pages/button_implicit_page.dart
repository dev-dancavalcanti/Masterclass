import 'package:flutter/material.dart';

class ButtonAnimatedImp extends StatefulWidget {
  const ButtonAnimatedImp({Key? key}) : super(key: key);

  @override
  State<ButtonAnimatedImp> createState() => _ButtonAnimatedImpState();
}

class _ButtonAnimatedImpState extends State<ButtonAnimatedImp> {
  bool gestorAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new))),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GestureDetector(
          onTap: () {
            setState(() {
              gestorAnimated = !gestorAnimated;
            });
          },
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 400),
            alignment:
                gestorAnimated ? Alignment.bottomRight : Alignment.topCenter,
            child: AnimatedContainer(
              width: gestorAnimated ? 50 : 100,
              height: 50,
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                  borderRadius:
                      gestorAnimated ? BorderRadius.circular(40) : null,
                  color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
