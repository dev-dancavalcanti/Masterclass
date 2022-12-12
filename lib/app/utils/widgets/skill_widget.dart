import 'package:flutter/material.dart';

class SkillWidget extends StatefulWidget {
  const SkillWidget({super.key, required this.title, required this.value});

  final String title;
  final double value;

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation valueAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    valueAnimation =
        Tween<double>(begin: 0, end: widget.value).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              widget.title,
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
                    value: valueAnimation.value,
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
