import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TileAnimationImplicit extends StatefulWidget {
  const TileAnimationImplicit(
      {Key? key, required this.title, required this.text})
      : super(key: key);
  final String title;
  final String text;

  @override
  State<TileAnimationImplicit> createState() => _TileAnimationImplicitState();
}

class _TileAnimationImplicitState extends State<TileAnimationImplicit> {
  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              test = !test;
            });
          },
          child: ListTile(
            title: Text('My expansion tile ${widget.title}'),
            trailing: AnimatedRotation(
              turns: test ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
        ClipRect(
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            heightFactor: test ? 1 : 0,
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
