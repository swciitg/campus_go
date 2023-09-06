
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';
import '../../stores/user_store.dart';

class RejectedOrderTileComponent extends StatelessWidget {
  const RejectedOrderTileComponent({
    super.key,
    required this.orderModel,
    required this.count,
  });

  final OrderModel orderModel;
  final int count;

  @override
  Widget build(BuildContext context) {
         var userStore = context.read<UserStore>();
    final ViewType viewType = userStore.viewType;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: viewType == ViewType.admin
                ? TextSpan(
                    children: [
                      TextSpan(
                          text: "Or. ID. ",
                          style: MyFonts.w400
                              .setColor(kWhite)
                              .size(16)),
                      TextSpan(
                          text: orderModel.id,
                          style: MyFonts.w600
                              .setColor(kWhite)
                              .size(16)),
                    ],
                  )
                : TextSpan(
                    children: [
                      TextSpan(
                          text: count.toString(),
                          style: MyFonts.w600
                              .setColor(kWhite)
                              .size(16)),
                      TextSpan(
                          text: " Items Ordered",
                          style: MyFonts.w300
                              .setColor(kWhite)
                              .size(16)),
                    ],
                  ),
          ),
        ]);
  }
}
