import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../functions/utility/calculate_order_value.dart';
import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';
import '../../stores/user_store.dart';

class PendingPaymentOrderTileComponent extends StatelessWidget {
  const PendingPaymentOrderTileComponent({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
            var userStore = context.read<UserStore>();
    final ViewType viewType = userStore.viewType;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '₹ ',
                    style:
                        MyFonts.w700.setColor(kWhite).size(16)),
                TextSpan(
                    text: orderTotal(orderModel.items).toString(),
                    style:
                        MyFonts.w700.setColor(kWhite).size(16)),
                TextSpan(
                    text: "/-",
                    style:
                        MyFonts.w700.setColor(kWhite).size(16)),
              ],
            ),
          ),
          if (viewType == ViewType.user)
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 80,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: lBlue,
                    // border: Border.all(color: kAppBarGrey),
                    borderRadius: BorderRadius.circular(4)),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: '₹ ',
                          style: MyFonts.w500
                              .setColor(kButtonText)
                              .size(12)),
                      TextSpan(
                          text: "Proceed",
                          style: MyFonts.w500
                              .setColor(kButtonText)
                              .size(12)),
                    ],
                  ),
                ),
              ),
            ),
        ]);
  }
}