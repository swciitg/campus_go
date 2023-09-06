import 'package:campus_go/globals/enums.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/orders/order_tile.dart';

class PreviousOrdersTab extends StatefulWidget {
  const PreviousOrdersTab({super.key});

  @override
  State<PreviousOrdersTab> createState() => _PreviousOrdersTabState();
}

class _PreviousOrdersTabState extends State<PreviousOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "All orders",
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
            itemCount: orderModels.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return OrderTile(orderID: orderModels.keys.elementAt(index));
          }),
        ),
      ]),
    );
  }
}