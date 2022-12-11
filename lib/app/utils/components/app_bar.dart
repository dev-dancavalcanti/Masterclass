import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget? myAppBar(
    BuildContext context, String title, void Function()? toggleTheme,
    [Icon? icon]) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: null,
    titleSpacing: 0,
    title: ListTile(
      trailing: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: GestureDetector(
            onTap: toggleTheme,
            child: SvgPicture.asset(
              'assets/icons/home/moon.svg',
              color: Theme.of(context).highlightColor,
            )),
      ),
      horizontalTitleGap: 5,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                if (icon != null) {
                  Navigator.pop(context);
                } else {}
              },
              child: icon ?? Image.asset('assets/images/home/logo.png')),
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      subtitle: const Text('Fluterrando Masterclass',
          textAlign: TextAlign.left,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
    ),
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.9),
    scrolledUnderElevation: 0,
  );
}
