import 'package:campus_go/pages/login/login_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

AppBar appBar(BuildContext context, String title,
    {bool displayProfileIcon = true,
    bool displayBackButton = false,
    bool displayLogoutButton = false,
    bool displayQRScanner=false}) {
       var userStore = context.read<UserStore>();
  return AppBar(
    backgroundColor: kAppBarGrey,
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
      if(userStore.viewType == ViewType.admin && displayQRScanner)  Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
              onTap: () {
                
              },
              child: Container(
                  height: 24,
                  width: 24,
                  // decoration: BoxDecoration(border: Border.all(color: kWhite,width: 1.5),shape: BoxShape.circle),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child:
                        // Icon(Icons.person_outline)
                        SvgPicture.asset("assets/images/qr_code_scanner.svg"),
                  ))),
        ),
      if (displayProfileIcon)
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/ps");
              },
              child: Container(
                  height: 26,
                  width: 26,
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
          child: GestureDetector(
            child: const Icon(Icons.logout),
            onTap: () {
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
