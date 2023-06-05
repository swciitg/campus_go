import 'package:campus_go/widgets/outlet/change_item_count_tile.dart';
import 'package:campus_go/widgets/profile/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  int selectedRadio = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              const ChangeItemCountTile(veg: true),
              const ChangeItemCountTile(veg: true),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRadio = 0;
                        });
                      },
                      child: Container(
                        width: 90,
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: Radio(
                                value: 0,
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
                              "Takeaway",
                              style: MyFonts.w400.setColor(kBlack).size(12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRadio = 1;
                        });
                      },
                      child: Container(
                        width: 90,
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: Radio(
                                value: 1,
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
                              "Delivery",
                              style: MyFonts.w400.setColor(kBlack).size(12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 150,
                child: TextField(
                  cursorColor: kBlack,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text("Any Instruction"),
                    labelStyle: MyFonts.w500.size(14).setColor(kBlack),
                    hintStyle: MyFonts.w500.size(14).setColor(kgrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kBlack, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kBlack, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kBlack, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: (() {
            
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
