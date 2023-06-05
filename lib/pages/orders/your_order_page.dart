import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/widgets/outlet/change_item_count_tile.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({super.key});

  @override
  State<YourOrderPage> createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "CampusGO", displayProfileIcon: true,displayBackButton: true),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Order",
              style: MyFonts.w500.setColor(kBlack).size(18),
            ),
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
                          "Lohit Canteen",
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kBlack).size(16),
                        ),
                        const SizedBox(height: 8,),
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
                            Text("Lohit Hostel",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    MyFonts.w300.setColor(kBlack).size(12)),
                          ],
                        )
                      ]),
                ),
              ),
              Container(
                color: kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   RichText(text: TextSpan(children: [
                    TextSpan(text: "Status: ",style: MyFonts.w600.size(12).setColor(kBlack)),
                    TextSpan(text: "Preparing",style: MyFonts.w300.size(12).setColor(kBlack)),
                   ])),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(text: TextSpan(children: [
                    TextSpan(text: "Order Date: ",style: MyFonts.w600.size(12).setColor(kBlack)),
                    TextSpan(text: "24/03/2023",style: MyFonts.w300.size(12).setColor(kBlack)),
                   ])),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 30,),
            const ItemCountTile(veg: true, editing: false),
            const ItemCountTile(veg: true, editing: false),
            const ItemCountTile(veg: true, editing: false),
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
                height: 32,
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
                    "Proceed to payment",
                    style: MyFonts.w400.setColor(kWhite).size(18),
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
