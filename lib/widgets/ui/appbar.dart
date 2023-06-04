import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

AppBar appBar(BuildContext context, String title,
    {bool displayProfileIcon = true}) {
  return AppBar(
    backgroundColor: kBlack,
    centerTitle: true,
    title: Text(
      title,
      style: MyFonts.w400.setColor(kWhite).size(24),
    ),
    leading: displayProfileIcon == true
        ? const Icon(null)
        : IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
    actions: [
      displayProfileIcon == false
          ? const Icon(null)
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/ps");
                },
                  child: Container(
                      height: 24,
                      width: 24,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child:
                              Icon(Icons.person_outline)
                              )
                              )),
            )
    ],
  );
}
