import 'package:campus_go/functions/utility/calculate_order_value.dart';
import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:campus_go/pages/orders/customer_order_page.dart';
import 'package:campus_go/pages/orders/your_order_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

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
    Duration passedDuration =
        DateTime.now().difference(orderModel.orderDateTime);
    String timeagoString =
        timeago.format(DateTime.now().subtract(passedDuration));

    return Observer(
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
                  child: Container(
                    color: kWhite,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewType == ViewType.admin
                                ? userModels[orderModel.userID]!.username
                                : outletModels[orderModel.outletID]!.outletName,
                            overflow: TextOverflow.ellipsis,
                            style: MyFonts.w600.setColor(kBlack).size(16),
                          ),
                          // const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text("Ordered $timeagoString",
                                overflow: TextOverflow.ellipsis,
                                style: MyFonts.w300.setColor(kBlack).size(8)),
                          )
                        ]),
                  ),
                ),
                if (orderModel.acceptanceStatus ==
                    AcceptanceStatus.queued.status)
                  Column(
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
                      ])
                else if (orderModel.acceptanceStatus ==
                    AcceptanceStatus.rejected.status)
                  Column(
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
                      ])
                else if (orderModel.paymentStatus ==
                    PaymentStatus.pending.status)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '₹ ',
                                  style:
                                      MyFonts.w700.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: orderTotal(orderModel.items).toString(),
                                  style:
                                      MyFonts.w700.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: "/-",
                                  style:
                                      MyFonts.w700.setColor(kBlack).size(16)),
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
                                  color: kBlack,
                                  border: Border.all(color: kBlack),
                                  borderRadius: BorderRadius.circular(4)),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '₹ ',
                                        style: MyFonts.w500
                                            .setColor(kWhite)
                                            .size(12)),
                                    TextSpan(
                                        text: "Proceed",
                                        style: MyFonts.w500
                                            .setColor(kWhite)
                                            .size(12)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ])
                else if (orderModel.paymentStatus ==
                    PaymentStatus.successful.status)
                  Column(
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
                      ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
