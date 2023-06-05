import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

AppBar appBar(BuildContext context, String title,
    {bool displayProfileIcon = true,bool displayBackButton=false}) {
  return AppBar(
    backgroundColor: kBlack,
    centerTitle: true,
    title: Text(
      title,
      style: MyFonts.w400.setColor(kWhite).size(24),
    ),
    leading: displayBackButton == false
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
                      decoration: BoxDecoration(border: Border.all(color: kWhite,width: 1.5),shape: BoxShape.circle),
                      child: const FittedBox(
                          fit: BoxFit.contain,
                          child:
                              Icon(Icons.person_outline)
                              )
                              )),
            )
    ],
  );
}
