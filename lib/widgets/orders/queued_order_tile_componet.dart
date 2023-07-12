
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';
import '../../stores/user_store.dart';

class QueuedOrderTileComponent extends StatelessWidget {
  const QueuedOrderTileComponent({
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: viewType == ViewType.admin
                ? TextSpan(
                    children: [
                      TextSpan(
                          text: "Or. ID. ",
                          style: MyFonts.w400
                              .setColor(kBlack)
                              .size(16)),
                      TextSpan(
                          text: orderModel.id,
                          style: MyFonts.w600
                              .setColor(kBlack)
                              .size(16)),
                    ],
                  )
                : TextSpan(
                    children: [
                      TextSpan(
                          text: count.toString(),
                          style: MyFonts.w600
                              .setColor(kBlack)
                              .size(16)),
                      TextSpan(
                          text: " Items Ordered",
                          style: MyFonts.w300
                              .setColor(kBlack)
                              .size(16)),
                    ],
                  ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 72,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kBlack,
                  border: Border.all(color: kBlack),
                  borderRadius: BorderRadius.circular(4)),
              child: viewType == ViewType.admin
                  ? Text(
                      "Accept",
                      style:
                          MyFonts.w500.size(12).setColor(kWhite),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                          const Icon(
                            Icons.close_outlined,
                            size: 12,
                            color: kWhite,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Cancel",
                            style: MyFonts.w500
                                .setColor(kWhite)
                                .size(12),
                          )
                        ]),
            ),
          ),
        ]);
  }
}
