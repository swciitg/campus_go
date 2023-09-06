
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/orders/order_tile.dart';

class WaitingOrdersTab extends StatefulWidget {
  const WaitingOrdersTab({super.key});

  @override
  State<WaitingOrdersTab> createState() => _WaitingOrdersTabState();
}

class _WaitingOrdersTabState extends State<WaitingOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "In Queue",
            style: MyFonts.w400.setColor(kWhite).size(12),
          ),
        ),
        const Divider(
          color: Colors.white12,
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return OrderTile(orderID: "q");
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Rejected Orders",
            style: MyFonts.w400.setColor(kWhite).size(12),
          ),
        ),
        const Divider(
          color: Colors.white12,
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
           itemCount: 3,
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           physics: const NeverScrollableScrollPhysics(),
           itemBuilder: (context,index){
           return OrderTile(orderID: "r");
            }),
        )
      ]),
    );
  }
}
