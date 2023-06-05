import 'package:flutter/material.dart';

import '../../globals/enums.dart';
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
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Successfully Ordered",
            style: MyFonts.w400.setColor(kBlack).size(12),
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
          height: 1,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              OrderTile(
                status: Status.successful,
                prepStatus: PrepStatus.preparing,
                isDelivery: true,
              ),
              OrderTile(
                status: Status.successful,
                prepStatus: PrepStatus.ready,
                isDelivery: false,
              ),
              OrderTile(
                status: Status.successful,
                prepStatus: PrepStatus.outForDelivery,
                isDelivery: true,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Waiting for payment",
            style: MyFonts.w400.setColor(kBlack).size(12),
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
          height: 1,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              OrderTile(
                status: Status.paymentPending,
              ),
              OrderTile(
                status: Status.paymentPending,
              ),
              OrderTile(
                status: Status.paymentPending,
              ),
            ],
          ),
        )
      ]),
    );
  }
}