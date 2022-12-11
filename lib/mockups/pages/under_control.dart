import 'package:flutter/material.dart';

class UnderControl extends StatelessWidget {
  const UnderControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new))),
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Image.asset(
            'assets/images/mockups/logo.png',
            width: 200,
            height: 200,
            scale: .4,
          ),
          const SizedBox(
            height: 30,
          ),
          const ListTile(
            title: Text(
              'Get your Money \nUnder Control',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Manage your expenses.\n Seamlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          // SizedBox(
          //   height: 90,
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(94, 92, 229, 1),
                borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                'Sign Up with Email ID',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 75,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/icons/mockups/google.png',
                        scale: 2,
                      ),
                    ),
                    const Text(
                      'Sign Up with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
