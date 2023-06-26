import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/outlet/cart_tab.dart';
import 'package:campus_go/pages/outlet/menu_tab.dart';
import 'package:campus_go/widgets/outlet/outlet_info.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

class OutletPage extends StatefulWidget {
  final OutletModel outletModel;
  const OutletPage({super.key, required this.outletModel});

  @override
  State<OutletPage> createState() => _OutletPageState();
}

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(context, "CampusGO", displayProfileIcon: false,displayBackButton: true),
        body: SafeArea(
            child: Column(
              children: [
                OutletInfo(outletModel: widget.outletModel),
                
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
                    MenuTab(outletModel: widget.outletModel,),
                    CartTab(outletModel: widget.outletModel,),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
