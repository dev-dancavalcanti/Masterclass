import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation iconAnimation;
  late Animation columnAnimation;
  late Animation titleAnimation;
  late Animation subTitleAnimation;
  late Animation visibilityAnimation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 4);

    _animationController = AnimationController(vsync: this, duration: duration);
    iconAnimation = Tween<double>(begin: 0, end: 50).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, .2, curve: Curves.bounceOut)));
    titleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.3, .5)));
    subTitleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.5, .7)));
    columnAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.2, .3)));
    visibilityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.7, 1)));

    _animationController.addListener(() {
      setState(() {
        if (_animationController.isCompleted && mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/home/logo.png',
                          width: iconAnimation.value,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRect(
                          child: Align(
                            widthFactor: columnAnimation.value,
                            child: SizedBox(
                              width: 115,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRect(
                                    child: Align(
                                      widthFactor: titleAnimation.value,
                                      child: Text(
                                        'flutterando',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                  ),
                                  ClipRect(
                                    child: Align(
                                      widthFactor: subTitleAnimation.value,
                                      child: Text(
                                        'Masterclass',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Opacity(
                          opacity: visibilityAnimation.value,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Theme.of(context).highlightColor,
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
