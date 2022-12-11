import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/tinder_button.dart';

class Tinder extends StatelessWidget {
  const Tinder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text =
        'By tapping Create Account or Sign In, you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new))),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(237, 114, 99, 1),
                Color.fromRGBO(236, 110, 100, 1),
                Color.fromRGBO(234, 96, 106, 1),
                Color.fromRGBO(234, 83, 113, 1),
                Color.fromRGBO(232, 75, 117, 1),
                Color.fromRGBO(234, 74, 119, 1)
              ]),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Image.asset(
                'assets/images/mockups/tinder_logo.png',
                scale: 4,
              )),
          Padding(
              padding: const EdgeInsets.only(
                  top: 100, bottom: 30, left: 35, right: 35),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  for (var string in text.split(' '))
                    TextSpan(
                      text: '$string ',
                      style: GoogleFonts.inter(
                          fontWeight: string.contains('Terms') ||
                                  string.contains('Privacy') ||
                                  string.contains('Policy') ||
                                  string.contains('Cookies')
                              ? FontWeight.bold
                              : FontWeight.normal,
                          decoration: string.contains('Terms') ||
                                  string.contains('Privacy') ||
                                  string.contains('Policy') ||
                                  string.contains('Cookies')
                              ? TextDecoration.underline
                              : null,
                          color: Colors.white,
                          fontSize: 12),
                    )
                ]),
              )),
          const TinderButton(
            icon: 'assets/icons/mockups/apple.svg',
            text: 'SIGN IN WITH APPLE',
          ),
          const TinderButton(
            icon: 'assets/icons/mockups/fb.svg',
            text: 'SIGN IN WITH FACEBOOK',
          ),
          const TinderButton(
            icon: 'assets/icons/mockups/chat.svg',
            text: 'SIGN IN WITH PHONE NUMBER',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Trouble Signing In?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
