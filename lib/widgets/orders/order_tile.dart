import 'package:campus_go/globals/enums.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class OrderTile extends StatefulWidget {
  final Status status;
  final PrepStatus? prepStatus;
  final bool? isDelivery;
  const OrderTile({super.key, required this.status, this.prepStatus, this.isDelivery});

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (() {}),
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
                          "Florentine",
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kBlack).size(16),
                        ),
                        // const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text("Ordered 6 hours ago",
                              overflow: TextOverflow.ellipsis,
                              style: MyFonts.w300.setColor(kBlack).size(8)),
                        )
                      ]),
                ),
              ),
              if (widget.status == Status.queued)
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '5',
                                  style:
                                      MyFonts.w600.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: " Items Ordered",
                                  style:
                                      MyFonts.w300.setColor(kBlack).size(16)),
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
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.close_outlined,
                                    size: 12,
                                    color: kWhite,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "Cancel",
                                    style:
                                        MyFonts.w500.setColor(kWhite).size(12),
                                  )
                                ]),
                          ),
                        ),
                      ]),
                )
              else if (widget.status == Status.rejected)
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '5',
                                  style:
                                      MyFonts.w600.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: " Items Ordered",
                                  style:
                                      MyFonts.w300.setColor(kBlack).size(16)),
                            ],
                          ),
                        ),
                      ]),
                )
              else if (widget.status == Status.paymentPending)
                Container(
                  child: Column(
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
                                  text: "3350",
                                  style:
                                      MyFonts.w700.setColor(kBlack).size(16)),
                              TextSpan(
                                  text: "/-",
                                  style:
                                      MyFonts.w700.setColor(kBlack).size(16)),
                            ],
                          ),
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
                      ]),
                )
              else if (widget.status == Status.successful)
                 Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if(widget.prepStatus==PrepStatus.outForDelivery) Text("Out for delivery",style:MyFonts.w600.setColor(kBlack).size(12) ,)
                        else if(widget.prepStatus==PrepStatus.ready) Text("Ready",style:MyFonts.w600.setColor(kBlack).size(12) ,)
                        else if(widget.prepStatus==PrepStatus.preparing) Text("Preparing",style:MyFonts.w600.setColor(kBlack).size(12) ,),
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
                                   widget.isDelivery!?Icons.delivery_dining_outlined: Icons.front_hand_outlined,
                                    size: 12,
                                    color: kWhite,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                   widget.isDelivery!?"Delivery" :"Takeaway",
                                    style:
                                        MyFonts.w500.setColor(kWhite).size(12),
                                  )
                                ]),
                          ),
                        ),
                      ]),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
