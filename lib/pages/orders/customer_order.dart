import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../models/item_model.dart';
import '../../widgets/outlet/change_item_count_tile.dart';
import '../../widgets/ui/appbar.dart';

class CustomerOrderPage extends StatefulWidget {
  final OrderModel orderModel;
  const CustomerOrderPage({super.key, required this.orderModel});

  @override
  State<CustomerOrderPage> createState() => _CustomerOrderPageState();
}

class _CustomerOrderPageState extends State<CustomerOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "CampusGO",
          displayProfileIcon: true, displayBackButton: true),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Customer Order ",
                style: MyFonts.w500.setColor(kBlack).size(18),
              ),
              TextSpan(
                text: "(${widget.orderModel.acceptanceStatus})",
                style: MyFonts.w500.setColor(kBlack).size(18),
              ),
            ])),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Container(
                height: 2,
                width: 30,
                color: kBlack,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(children: [
              Expanded(
                // flex: 7,
                child: Container(
                  color: kWhite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderModel.outletID,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kBlack).size(16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.pin_drop_outlined,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("Outlet Location",
                                overflow: TextOverflow.ellipsis,
                                style: MyFonts.w300.setColor(kBlack).size(12)),
                          ],
                        )
                      ]),
                ),
              ),
              Container(
                color: kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Order date: ",
                          style: MyFonts.w600.size(12).setColor(kBlack)),
                      TextSpan(
                          text: DateFormat("dd/MM/yyyy")
                              .format(widget.orderModel.orderDateTime),
                          style: MyFonts.w300.size(12).setColor(kBlack)),
                    ])),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Order Time: ",
                          style: MyFonts.w600.size(12).setColor(kBlack)),
                      TextSpan(
                          text: DateFormat("h:mm a")
                              .format(widget.orderModel.orderDateTime),
                          style: MyFonts.w300.size(12).setColor(kBlack)),
                    ])),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            if (widget.orderModel.paymentStatus == PaymentStatus.pending.status)
              Column(
                children: [
                  Text(
                    "Payment is still pending by user!!",
                    style: MyFonts.w700.size(16).setColor(kBlack),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ItemCountTile(
              itemModel: ItemModel(
                  id: "id",
                  name: "Papdi Chaat",
                  price: "160",
                  category: "VEG",
                  offeringOutlet: "offeringOutlet"),
              editing: false,
              count: 1,
            ),
            ItemCountTile(
              itemModel: ItemModel(
                  id: "id",
                  name: "Chicken Biryani",
                  price: "160",
                  category: "NON-VEG",
                  offeringOutlet: "offeringOutlet"),
              editing: false,
              count: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlack),
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Order Value:",
                        style: MyFonts.w500.setColor(kBlack).size(18),
                      ),
                      Text(
                        "₹ " + "3350" + "/-",
                        style: MyFonts.w700.setColor(kBlack).size(18),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (widget.orderModel.acceptanceStatus ==
                AcceptanceStatus.queued.status)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kBlack),
                          child: Text(
                            "Accept",
                            style: MyFonts.w400.setColor(kWhite).size(18),
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(color: kBlack),
                              borderRadius: BorderRadius.circular(8),
                              color: kWhite),
                          child: Text(
                            "Reject",
                            style: MyFonts.w400.setColor(kBlack).size(18),
                          ),
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            if (widget.orderModel.paymentStatus ==
                    PaymentStatus.successful.status &&
                widget.orderModel.acceptanceStatus ==
                    AcceptanceStatus.accepted.status)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pressing below button send notification to customer. Press only when order is ready!",
                    style: MyFonts.w400.setColor(kBlack).size(12),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (() {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const YourOrderPage()));
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Confirm ready order !!",
                        style: MyFonts.w400.setColor(kWhite).size(18),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      )),
    );
  }
}
