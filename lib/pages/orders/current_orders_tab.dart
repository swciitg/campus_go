import 'package:campus_go/models/order_model.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode:OrderModes.delivery.toString(),
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.preparing.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.successful.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
              ),
              OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode: OrderModes.takeaway.toString(),
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.ready.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.successful.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
              ),
              OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode: OrderModes.delivery.toString(),
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.preparing.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.successful.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode: "Delivery",
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.preparing.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.pending.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
              ),
              OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode: "Delivery",
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.preparing.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.pending.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
              ),OrderTile(
                orderModel: OrderModel(
                    outletID: "Florentine",
                    userID: "userID",
                    orderMode: "Delivery",
                    instructions: "instructions",
                    items: [],
                    deliveryLocation: "deliveryLocation",
                    prepStatus: PrepStatus.preparing.toString(),
                    acceptanceStatus: AcceptanceStatus.accepted.toString(),
                    paymentStatus: PaymentStatus.pending.toString(),
                    qrCodeSecret: "qrCodeSecret",
                    orderDateTime: DateTime.now()),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
