
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/orders/order_tile.dart';

class CurrentOrdersTab extends StatefulWidget {
  const CurrentOrdersTab({super.key});

  @override
  State<CurrentOrdersTab> createState() => _CurrentOrdersTabState();
}

class _CurrentOrdersTabState extends State<CurrentOrdersTab> {
  @override
  Widget build(BuildContext context) {
    List<String> ids = ['asp','asr','aso'];
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Successfully Ordered",
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
          return OrderTile(orderID: ids[index]);
            }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Waiting for payment",
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
          return OrderTile(orderID: "ap");
            }),
        )
      ]),
    );
  }
}
