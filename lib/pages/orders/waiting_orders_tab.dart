import 'package:flutter/material.dart';

import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';
import '../../widgets/orders/order_tile.dart';

class WaitingOrdersTab extends StatefulWidget {
  const WaitingOrdersTab({super.key});

  @override
  State<WaitingOrdersTab> createState() => _WaitingOrdersTabState();
}

class _WaitingOrdersTabState extends State<WaitingOrdersTab> {
  final ViewType viewType =ViewType.admin;
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
            style: MyFonts.w400.setColor(kBlack).size(12),
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
             OrderTile(
                orderID: "q",
              ),
              OrderTile(
                orderID: 'q',
              ),
               OrderTile(
                orderID: 'q',
              ),
             
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Rejected Orders",
            style: MyFonts.w400.setColor(kBlack).size(12),
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
             
              OrderTile(
                orderID: "r",
              ),
              OrderTile(
                orderID: 'r',
              ),
               OrderTile(
                orderID: 'r',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
