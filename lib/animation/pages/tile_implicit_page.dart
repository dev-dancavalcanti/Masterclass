import 'package:flutter/material.dart';
import '../widget/tile_implicit.dart';

class TileAnimationImp extends StatefulWidget {
  const TileAnimationImp({Key? key}) : super(key: key);

  @override
  State<TileAnimationImp> createState() => _TileAnimationImpState();
}

class _TileAnimationImpState extends State<TileAnimationImp> {
  bool gestorAnimated = true;
  String texto =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit Suspendisse bulputate arcu interdum lacus pulvinar aliquam Donec ut nunc eleifed, volutpat tellus vel, volutpat libero faucibus, lobortis arcu. Nullam tempor vehicula nibh et ornare Etiam interdum tellus ut metus faucibus semper. Aliquam quis ullamcorper urna, non semper purus. Mauris luctus quam enim, u ornare magna vestiblum vel. Donec consectetur, quam a manttis tincidunt, augue nisi bibendum est, quis viverra risus odio ao ligula. Nullam vitae urna malesuada magna imperdiet faucibus non et nunc. Interger magna nisi, dictum a tempus in, bibendum quis nisi. Aliquam imperdiet metus id metus retrum scelerisque Morbi at nisi nec risus accumsan tempus. Curabitur non sem sh amet tellus eleifend tincidunt. Pellentesque sed lacus orci.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        itemBuilder: (context, index) => TileAnimationImplicit(
          title: '$index',
          text: texto,
        ),
        itemCount: 20,
      ),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new))),
    );
  }
}
