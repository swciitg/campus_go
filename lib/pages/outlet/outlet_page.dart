import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/pages/outlet/cart_tab.dart';
import 'package:campus_go/pages/outlet/menu_tab.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

class OutletPage extends StatefulWidget {
  const OutletPage({super.key});

  @override
  State<OutletPage> createState() => _OutletPageState();
}

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(context, "CampusGO", displayProfileIcon: false),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Lohit Canteen",
                              style: MyFonts.w600.setColor(kBlack).size(24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.pin_drop_outlined,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text("Lohit hostel",
                                      overflow: TextOverflow.ellipsis,
                                      style: MyFonts.w300
                                          .setColor(kBlack)
                                          .size(12)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 2,
                          width: 30,
                          color: kBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 18,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.phone_outlined,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "+91 " + "8502909980",
                                        style: MyFonts.w300,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ]),
                              ),
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "OPEN",
                                      style: MyFonts.w500
                                          .setColor(kBlack)
                                          .size(12),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      // SizedBox(height: 16,),
                    ]),
              ),
              const Divider(
                color: kBlack,
                thickness: 1,
                height: 1,
              ),
              TabBar(indicatorColor: kBlack,  tabs: [
                Container(
                  height: 48,
                  alignment: Alignment.center,
                  child: Text(
                    "Menu",
                    style: MyFonts.w500.setColor(kBlack).size(14),
                  ),
                ),
                Container(
                  height: 48,
                  alignment: Alignment.center,
                  child: Text(
                    "Cart",
                    style: MyFonts.w500.setColor(kBlack).size(14),
                  ),
                ),
              ]),
              const Divider(
                color: Colors.black12,
                thickness: 1,
                height: 1,
              ),
              Expanded(
                child: TabBarView(children: [
                  MenuTab(),
                  CartTab(),
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
