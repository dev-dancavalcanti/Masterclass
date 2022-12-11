import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class TileAnimationExplicit extends StatefulWidget {
  const TileAnimationExplicit(
      {Key? key, required this.title, required this.text})
      : super(key: key);
  final String title;
  final String text;

  @override
  State<TileAnimationExplicit> createState() => _TileAnimationExplicitState();
}

class _TileAnimationExplicitState extends State<TileAnimationExplicit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation heightAnimation;
  late Animation rotationIconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    heightAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    rotationIconAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: ListTile(
            trailing: Transform.rotate(
                angle: rotationIconAnimation.value * math.pi,
                child: const Icon(Icons.keyboard_arrow_down)),
            title: Text('My expansion tile ${widget.title}'),
          ),
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: heightAnimation.value,
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/about/flutter.svg'),
                Text(
                  widget.text,
                ),
                const Divider()
              ],
            ),
          ),
        )
      ],
    );
  }
}
