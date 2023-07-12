import 'package:campus_go/functions/utility/calculate_order_value.dart';
import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:campus_go/pages/orders/customer_order_page.dart';
import 'package:campus_go/pages/orders/your_order_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:campus_go/widgets/orders/queued_order_tile_componet.dart';
import 'package:campus_go/widgets/orders/rejected_order_tile_component.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import 'name_time_component.dart';
import 'pending_payment_order_tile_component.dart';
import 'successful_payment_order_tile_component.dart';

class OrderTile extends StatefulWidget {
  final String orderID;
  const OrderTile({
    super.key,
    required this.orderID,
  });

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = orderModels[widget.orderID]!;
    var userStore = context.read<UserStore>();
    final ViewType viewType = userStore.viewType;
    int count = 0;
    for (var cnt in orderModel.items.values) {
      count = count + cnt;
    }
   
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: (() {
            if (viewType == ViewType.admin) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CustomerOrderPage(orderModel: orderModel)));
            } else {
              {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        YourOrderPage(orderModel: orderModel)));
              }
            }
          }),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: kBlack),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 6, 8, 6),
              child: Row(children: [
                Expanded(
                  // flex: 7,
                  child: NameTimeComponent(orderModel: orderModel),
                ),
                if (orderModel.acceptanceStatus ==
                    AcceptanceStatus.queued.status)
                  QueuedOrderTileComponent(orderModel: orderModel, count: count)
                else if (orderModel.acceptanceStatus ==
                    AcceptanceStatus.rejected.status)
                  RejectedOrderTileComponent(orderModel: orderModel, count: count)
                else if (orderModel.paymentStatus ==
                    PaymentStatus.pending.status)
                  PendingPaymentOrderTileComponent(orderModel: orderModel,)
                else if (orderModel.paymentStatus ==
                    PaymentStatus.successful.status)
                  SuccessfulPaymentOrderTileComponent(orderModel: orderModel)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

