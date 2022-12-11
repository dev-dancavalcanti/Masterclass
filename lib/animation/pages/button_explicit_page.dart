import 'package:flutter/material.dart';

class ButtonAnimatedExp extends StatefulWidget {
  const ButtonAnimatedExp({Key? key}) : super(key: key);

  @override
  State<ButtonAnimatedExp> createState() => _ButtonAnimatedExpState();
}

class _ButtonAnimatedExpState extends State<ButtonAnimatedExp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation sizeContainer;
  late Animation circleContainer;
  late Animation alignContainer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    sizeContainer = Tween<double>(begin: 50, end: 100).animate(_controller);

    circleContainer = Tween<double>(begin: 40, end: 0).animate(_controller);

    alignContainer =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: Center(
              child: Align(
                alignment: alignContainer.value,
                child: Container(
                  width: sizeContainer.value,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(circleContainer.value),
                      color: Colors.blue),
                ),
              ),
            ),
          ),
        ));
  }
}
