import 'package:campus_go/pages/orders/current_orders_tab.dart';
import 'package:campus_go/pages/orders/previous_orders_tab.dart';
import 'package:campus_go/pages/orders/waiting_orders_tab.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(indicatorColor: kBlack, tabs: [
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Text(
                "Waiting",
                style: MyFonts.w500.setColor(kBlack).size(14),
              ),
            ),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Text(
                "Current",
                style: MyFonts.w500.setColor(kBlack).size(14),
              ),
            ),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Text(
                "Previous",
                style: MyFonts.w500.setColor(kBlack).size(14),
              ),
            ),
          ]),
          const SizedBox(height: 16,),
          const Expanded(child: TabBarView(children: [
            WaitingOrdersTab(),
            CurrentOrdersTab(),
            PreviousOrdersTab()
          ],))
        ],
      ),
    );
  }
}
