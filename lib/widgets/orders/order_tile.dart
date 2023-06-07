import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class OrderTile extends StatefulWidget {
  final OrderModel orderModel;
  const OrderTile({super.key, required this.orderModel, });

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    Duration passedDuration =
        DateTime.now().difference(widget.orderModel.orderDateTime);
    String timeagoString =
        timeago.format(DateTime.now().subtract(passedDuration));
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
                          widget.orderModel.outletID,
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
              if (widget.orderModel.acceptanceStatus == AcceptanceStatus.queued.toString())
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.orderModel.items.length.toString(),
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
                                  style:
                                      MyFonts.w500.setColor(kWhite).size(12),
                                )
                              ]),
                        ),
                      ),
                    ])
              else if (widget.orderModel.acceptanceStatus == AcceptanceStatus.rejected.toString())
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.orderModel.items.length.toString(),
                                style:
                                    MyFonts.w600.setColor(kBlack).size(16)),
                            TextSpan(
                                text: " Items Ordered",
                                style:
                                    MyFonts.w300.setColor(kBlack).size(16)),
                          ],
                        ),
                      ),
                    ])
              else if (widget.orderModel.paymentStatus == PaymentStatus.pending.toString())
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
                    ])
              else if (widget.orderModel.paymentStatus == PaymentStatus.successful.toString())
                 Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       if(widget.orderModel.prepStatus==PrepStatus.outForDelivery.toString()) Text("Out for delivery",style:MyFonts.w600.setColor(kBlack).size(12) ,)
                       else if(widget.orderModel.prepStatus==PrepStatus.ready.toString()) Text("Ready",style:MyFonts.w600.setColor(kBlack).size(12) ,)
                       else if(widget.orderModel.prepStatus==PrepStatus.preparing.toString()) Text("Preparing",style:MyFonts.w600.setColor(kBlack).size(12) ,),
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
                                  widget.orderModel.orderMode==OrderModes.delivery.toString()?Icons.delivery_dining_outlined: Icons.front_hand_outlined,
                                   size: 12,
                                   color: kWhite,
                                 ),
                                 const SizedBox(
                                   width: 2,
                                 ),
                                 Text(
                                  widget.orderModel.orderMode==OrderModes.delivery.toString()?"Delivery" :"Takeaway",
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
    );
  }
}
