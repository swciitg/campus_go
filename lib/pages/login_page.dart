import 'package:campus_go/globals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../globals/my_colors.dart';
import '../globals/my_fonts.dart';

class LoginPage extends StatefulWidget {
  static String id = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: FittedBox(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CampusGO",
                    style: MyFonts.w400.setColor(kWhite).size(48),
                  ),
                  Text(
                    "welcomes you",
                    style: MyFonts.w400.setColor(kWhite).size(22),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Container(
                    height: 48,
                    
                    // width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login with Outlook", style: MyFonts.w500.setColor(kBlack).size(22),),
                          const SizedBox(width: 12 ,),
                          Container(
                            height: 24,
                            width: 30,
                            child: SvgPicture.asset("assets/images/outlook.svg")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
