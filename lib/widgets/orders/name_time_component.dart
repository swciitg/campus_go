import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../globals/enums.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/order_model.dart';
import '../../stores/user_store.dart';

class NameTimeComponent extends StatelessWidget {
  const NameTimeComponent({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
     var userStore = context.read<UserStore>();
    final ViewType viewType = userStore.viewType;
     Duration passedDuration =
        DateTime.now().difference(orderModel.orderDateTime);
    String timeagoString =
        timeago.format(DateTime.now().subtract(passedDuration));
    return Container(
      // color: kWhite,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewType == ViewType.admin
                  ? userModels[orderModel.userID]!.username
                  : outletModels[orderModel.outletID]!.outletName,
              overflow: TextOverflow.ellipsis,
              style: MyFonts.w600.setColor(kWhite).size(16),
            ),
            // const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text("Ordered $timeagoString",
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.w300.setColor(kWhite).size(8)),
            )
          ]),
    );
  }
}
