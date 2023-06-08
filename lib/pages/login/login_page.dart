import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/pages/home/home_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class LoginPage extends StatefulWidget {
  static String id = "/";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var userStore = context.read<UserStore>();
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: kBlack,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
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
                    SizedBox(
                      height: 48,
                      width: 280,

                      // width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (() {
                          userStore.signInUser();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                          userStore.setViewType(ViewType.user);
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kWhite,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person_2_outlined,
                                color: kBlack,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Login as User",
                                style: MyFonts.w600.setColor(kBlack).size(22),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 48,
                      width: 280,

                      // width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (() {
                          Navigator.of(context).pushNamed("/login");
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kWhite,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.storefront_outlined,
                                color: kBlack,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Login as Admin",
                                style: MyFonts.w600.setColor(kBlack).size(22),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 48,
                    // ),
                    // SizedBox(
                    //   height: 48,

                    //   // width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: (() {
                    //       Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                    //     }),
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: kWhite,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(8))),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text("Login with Outlook", style: MyFonts.w500.setColor(kBlack).size(22),),
                    //         const SizedBox(width: 12 ,),
                    //         SizedBox(
                    //           height: 24,
                    //           width: 30,
                    //           child: SvgPicture.asset("assets/images/outlook.svg")),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
