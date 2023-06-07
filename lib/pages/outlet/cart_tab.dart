import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/orders/your_order_page.dart';
import 'package:campus_go/widgets/common/custom_text_field.dart';
import 'package:campus_go/widgets/outlet/change_item_count_tile.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class CartTab extends StatefulWidget {
  final OutletModel outletModel;
  const CartTab({super.key, required this.outletModel});
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final TextEditingController _deliveryLocationController =
      TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    int itemCount = 1;
    return itemCount == 0
        ? Center(
            child: Text(
            "No item added to your cart!",
            style: MyFonts.w500.setColor(kBlack).size(16),
          ))
        : Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Place you order",
                              style: MyFonts.w600.setColor(kBlack).size(18),
                            ),
                            Text(
                              "Use counter to select quantity",
                              style: MyFonts.w300.setColor(kBlack).size(10),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ItemCountTile(
                      itemModel: ItemModel(
                          id: "id",
                          name: "Papdi Chaat",
                          price: "160",
                          category: "VEG",
                          offeringOutlet: "offeringOutlet"),
                      editing: true,
                      count: 1,
                    ),
                    ItemCountTile(
                      itemModel: ItemModel(
                          id: "id",
                          name: "Chicken Biryani",
                          price: "160",
                          category: "NON-VEG",
                          offeringOutlet: "offeringOutlet"),
                      editing: true,
                      count: 2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Select order mode",
                      style: MyFonts.w500.setColor(kBlack).size(16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                        height: 24,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: widget.outletModel.service.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return Align(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedRadio = index;
                                    });
                                  },
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Radio(
                                            value: index,
                                            groupValue: selectedRadio,
                                            onChanged: (val) {
                                              setState(() {
                                                selectedRadio = val!;
                                              });
                                            },
                                            activeColor: kBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          widget.outletModel.service[index],
                                          style: MyFonts.w400
                                              .setColor(kBlack)
                                              .size(12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
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
                      height: 24,
                    ),
                    widget.outletModel.service[selectedRadio] ==
                            OrderModes.delivery.toString()
                        ? Column(
                            children: [
                              SizedBox(
                                  child: CustomTextField(
                                hintText: "Delivery Location",
                                isNecessary: false,
                                controller: _deliveryLocationController,
                              )),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                        height: 150,
                        child: CustomTextField(
                          hintText: "Any Instruction",
                          isNecessary: false,
                          maxLines: null,
                          inputType: TextInputType.multiline,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          controller: _instructionsController,
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const YourOrderPage()));
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kBlack,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          "Make Order",
                          style: MyFonts.w400.setColor(kWhite).size(18),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
  }
}
