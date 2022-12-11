import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TinderButton extends StatelessWidget {
  const TinderButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height * .07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(
                      icon,
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ));
  }
}
