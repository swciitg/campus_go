import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../functions/utility/calculate_order_value.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
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
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Or. No.: ",
                              style: MyFonts.w300.size(16).setColor(kBlack)),
                          TextSpan(
                              text: widget.orderModel.id,
                              style: MyFonts.w600.size(16).setColor(kBlack)),
                        ])),
                        const SizedBox(
                          height: 8,
                        ),

                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Mode: ",
                              style: MyFonts.w300.size(12).setColor(kBlack)),
                          TextSpan(
                              text: widget.orderModel.orderMode,
                              style: MyFonts.w600.size(12).setColor(kBlack)),
                        ])),
                        const SizedBox(
                          height: 4,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Call: ",
                              style: MyFonts.w300.size(12).setColor(kBlack)),
                          TextSpan(
                              text:"+91 ${userModels[widget.orderModel.userID]!.phoneNumber}",
                              style: MyFonts.w600.size(12).setColor(kBlack)),
                        ])),
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
                          text: "By: ",
                          style: MyFonts.w300.size(12).setColor(kBlack)),
                      TextSpan(
                          text: userModels[widget.orderModel.userID]!.username,
                          style: MyFonts.w600.size(12).setColor(kBlack)),
                    ])),
                    const SizedBox(
                      height: 8,
                    ),
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
                      height: 4,
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
            if (widget.orderModel.acceptanceStatus==AcceptanceStatus.accepted.status && widget.orderModel.paymentStatus == PaymentStatus.pending.status)
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
            ListView.builder(
                itemCount: widget.orderModel.items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String itemID = widget.orderModel.items.keys.elementAt(index);
                  return ItemCountTile(
                    editing: false,
                    itemID: itemID,
                    count: widget.orderModel.items[itemID],
                  );
                }),
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
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "₹ ",
                          style: MyFonts.w700.setColor(kBlack).size(18),
                        ),
                        TextSpan(
                          text: orderTotal(widget.orderModel.items).toString(),
                          style: MyFonts.w700.setColor(kBlack).size(18),
                        ),
                        TextSpan(
                          text: "/-",
                          style: MyFonts.w700.setColor(kBlack).size(18),
                        )
                      ]))
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
