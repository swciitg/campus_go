import 'package:campus_go/pages/login/login_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

AppBar appBar(BuildContext context, String title,
    {bool displayProfileIcon = true,
    bool displayBackButton = false,
    bool displayLogoutButton = false}) {
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
      if (displayProfileIcon)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/ps");
              },
              child: Container(
                  height: 24,
                  width: 24,
                  // decoration: BoxDecoration(border: Border.all(color: kWhite,width: 1.5),shape: BoxShape.circle),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child:
                        // Icon(Icons.person_outline)
                        SvgPicture.asset("assets/images/profile.svg"),
                  ))),
        ),
      if (displayLogoutButton)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<UserStore>().logOut(() => Navigator.of(context)
                  .pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false));
            },
          ),
        ),
    ],
  );
}
