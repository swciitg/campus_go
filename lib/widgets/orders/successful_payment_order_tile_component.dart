import 'package:flutter/material.dart';


import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';

class SuccessfulPaymentOrderTileComponent extends StatelessWidget {
  const SuccessfulPaymentOrderTileComponent({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            orderModel.prepStatus,
            style: MyFonts.w600.setColor(kBlack).size(12),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 80,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kBlack,
                  border: Border.all(color: kBlack),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      orderModel.orderMode ==
                              OrderModes.delivery.orderMode
                          ? Icons.delivery_dining_outlined
                          : Icons.front_hand_outlined,
                      size: 12,
                      color: kWhite,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      orderModel.orderMode,
                      style:
                          MyFonts.w500.setColor(kWhite).size(12),
                    )
                  ]),
            ),
          ),
        ]);
  }
}
