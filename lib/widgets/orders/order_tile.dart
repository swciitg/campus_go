import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:campus_go/pages/orders/customer_order.dart';
import 'package:campus_go/pages/orders/your_order_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class OrderTile extends StatefulWidget {
  final OrderModel orderModel;
  // final ViewType viewType;
  const OrderTile({
    super.key,
    required this.orderModel,
    // required this.viewType,
  });

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    var userStore = context.read<UserStore>();
    final ViewType viewType = userStore.viewType;
    int count = 0;
    for (var cnt in widget.orderModel.items.values) {
      count = count + cnt;
    }
    Duration passedDuration =
        DateTime.now().difference(widget.orderModel.orderDateTime);
    String timeagoString =
        timeago.format(DateTime.now().subtract(passedDuration));
        
    return Observer(
      builder: (context) => 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: (() {
            if (viewType == ViewType.admin) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CustomerOrderPage(orderModel: widget.orderModel)));
            } else {
              if (widget.orderModel.acceptanceStatus ==
                      AcceptanceStatus.queued.status ||
                  (widget.orderModel.paymentStatus ==
                          PaymentStatus.successful.status &&
                      widget.orderModel.prepStatus == PrepStatus.ready.status)) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        YourOrderPage(orderModel: widget.orderModel)));
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
                                ? widget.orderModel.userID
                                : widget.orderModel.outletID,
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
                if (widget.orderModel.acceptanceStatus ==
                    AcceptanceStatus.queued.status)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: viewType==ViewType.admin?TextSpan(
                            children: [
                              TextSpan(
                                  text: "Or. ID. ",
                                  style: MyFonts.w400.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: widget.orderModel.id,
                                  style: MyFonts.w600.setColor(kBlack).size(16)),
                            ],
                          ): TextSpan(
                            children: [
                              TextSpan(
                                  text: count.toString(),
                                  style: MyFonts.w600.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: " Items Ordered",
                                  style: MyFonts.w300.setColor(kBlack).size(16)),
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
                                    style: MyFonts.w500.size(12).setColor(kWhite),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                else if (widget.orderModel.acceptanceStatus ==
                    AcceptanceStatus.rejected.status)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: viewType==ViewType.admin?TextSpan(
                            children: [
                              TextSpan(
                                  text: "Or. ID. ",
                                  style: MyFonts.w400.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: widget.orderModel.id,
                                  style: MyFonts.w600.setColor(kBlack).size(16)),
                            ],
                          ):TextSpan(
                            children: [
                              TextSpan(
                                  text: count.toString(),
                                  style: MyFonts.w600.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: " Items Ordered",
                                  style: MyFonts.w300.setColor(kBlack).size(16)),
                            ],
                          ),
                        ),
                      ])
                else if (widget.orderModel.paymentStatus ==
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
                                  style: MyFonts.w700.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: "3350",
                                  style: MyFonts.w700.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: "/-",
                                  style: MyFonts.w700.setColor(kBlack).size(16)),
                            ],
                          ),
                        ),
                       if(viewType==ViewType.user) GestureDetector(
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
                                      style:
                                          MyFonts.w500.setColor(kWhite).size(12)),
                                  TextSpan(
                                      text: "Proceed",
                                      style:
                                          MyFonts.w500.setColor(kWhite).size(12)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ])
                else if (widget.orderModel.paymentStatus ==
                    PaymentStatus.successful.status)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.orderModel.prepStatus,
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
                                    widget.orderModel.orderMode ==
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
                                    widget.orderModel.orderMode,
                                    style: MyFonts.w500.setColor(kWhite).size(12),
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
