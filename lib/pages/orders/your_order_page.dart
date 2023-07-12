import 'package:campus_go/functions/utility/calculate_order_value.dart';
import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:campus_go/widgets/outlet/change_item_count_tile.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class YourOrderPage extends StatefulWidget {
  final OrderModel orderModel;
  const YourOrderPage({super.key, required this.orderModel});

  @override
  State<YourOrderPage> createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "CampusGO",
          displayProfileIcon: true, displayBackButton: true),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Order (${widget.orderModel.acceptanceStatus})",
                style: MyFonts.w500.setColor(kWhite).size(18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Container(
                  height: 2,
                  width: 30,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(children: [
                Expanded(
                  // flex: 7,
                  child: Container(
                    // color: kWhite,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            outletModels[widget.orderModel.outletID]!.outletName,
                            overflow: TextOverflow.ellipsis,
                            style: MyFonts.w600.setColor(kWhite).size(16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.call_outlined,
                                color: kGrey2,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                  "+91 ${outletModels[widget.orderModel.outletID]!.phoneNumber}",
                                  overflow: TextOverflow.ellipsis,
                                  style: MyFonts.w300.setColor(kWhite).size(12)),
                            ],
                          )
                        ]),
                  ),
                ),
                Container(
                  // color: kWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Order date: ",
                            style: MyFonts.w600.size(12).setColor(kWhite)),
                        TextSpan(
                            text: DateFormat("dd/MM/yyyy")
                                .format(widget.orderModel.orderDateTime),
                            style: MyFonts.w300.size(12).setColor(kWhite)),
                      ])),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Order Time: ",
                            style: MyFonts.w600.size(12).setColor(kWhite)),
                        TextSpan(
                            text: DateFormat("h:mm a")
                                .format(widget.orderModel.orderDateTime),
                            style: MyFonts.w300.size(12).setColor(kWhite)),
                      ])),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 32,
              ),
              if(widget.orderModel.acceptanceStatus==AcceptanceStatus.accepted.status && widget.orderModel.paymentStatus==PaymentStatus.successful.status)Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: kAppBarGrey, width: 4),
                          borderRadius: BorderRadius.circular(16),
                          color: kWhite),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "ORDER QR CODE",
                              style: TextStyle(
                                  shadows: [
                                    Shadow(color: kButtonText, offset: Offset(0, -1))
                                  ],
                                  color: Colors.transparent,
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: kBlack,
                                  decorationThickness: 1),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            QrImageView(
                              data: widget.orderModel.qrCodeSecret,
                              version: QrVersions.auto,
                              size: 140,
                              gapless: false,
                              embeddedImage: const ResizeImage(
                                  AssetImage("assets/images/logo.jpg"),
                                  height: 70,
                                  width: 50),
                              embeddedImageStyle: const QrEmbeddedImageStyle(
                                size: Size(28, 20),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
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
                    // border: Border.all(color: kWhite),
                    color: kAppBarGrey,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Order Value:",
                          style: MyFonts.w500.setColor(kWhite).size(18),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "₹ ",
                            style: MyFonts.w700.setColor(kWhite).size(18),
                          ),
                          TextSpan(
                            text: orderTotal(widget.orderModel.items).toString(),
                            style: MyFonts.w700.setColor(kWhite).size(18),
                          ),
                          TextSpan(
                            text: "/-",
                            style: MyFonts.w700.setColor(kWhite).size(18),
                          )
                        ]))
                      ]),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              if (widget.orderModel.acceptanceStatus ==
                      AcceptanceStatus.queued.status ||
                  widget.orderModel.acceptanceStatus ==
                          AcceptanceStatus.accepted.status &&
                      widget.orderModel.paymentStatus ==
                          PaymentStatus.pending.status)
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (() {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const YourOrderPage()));
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:widget.orderModel.acceptanceStatus ==
                      AcceptanceStatus.queued.status?kRed: lBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: 
                    Text(
                     widget.orderModel.acceptanceStatus ==
                      AcceptanceStatus.queued.status? "Cancel":"Proceed to payment",
                      style: MyFonts.w400.setColor(kButtonText).size(18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
