import 'package:campus_go/functions/utility/show_snackbar.dart';
import 'package:campus_go/functions/utility/validator.dart';
import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/home/home_page.dart';

import 'package:campus_go/stores/cart_store.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:campus_go/widgets/common/custom_text_field.dart';
import 'package:campus_go/widgets/outlet/change_item_count_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();

  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    _deliveryLocationController.text =
        context.read<UserStore>().userData['deliveryLocation']!;
  }

  @override
  Widget build(BuildContext context) {
    var cartStore = context.read<CartStore>();

    return Observer(
      builder: (context) => cartStore.cart.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No item added to your cart!",
                  style: MyFonts.w500.setColor(kWhite).size(16),
                ),
                const SizedBox(
                  height: 64,
                )
              ],
            ))
          : GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Padding(
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
                                  style: MyFonts.w600.setColor(kWhite).size(18),
                                ),
                                Text(
                                  "Use counter to select quantity",
                                  style: MyFonts.w300.setColor(kWhite).size(10),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                            itemCount: cartStore.totalItems,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ItemCountTile(
                                editing: true,
                                itemID: cartStore.cart.keys.elementAt(index),
                              );
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Select order mode",
                          style: MyFonts.w500.setColor(kWhite).size(16),
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  return Align(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedRadio = index;
                                        });
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor: kWhite),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  activeColor: kWhite,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                widget
                                                    .outletModel.service[index],
                                                style: MyFonts.w400
                                                    .setColor(kWhite)
                                                    .size(12),
                                              ),
                                            ],
                                          ),
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
                              // border: Border.all(color: kBlack),
                              color: kAppBarGrey,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Order Value:",
                                    style:
                                        MyFonts.w500.setColor(kWhite).size(18),
                                  ),
                                  Text(
                                    "₹ ${cartStore.cartTotal}/-",
                                    style:
                                        MyFonts.w700.setColor(kWhite).size(18),
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        if (widget.outletModel.service[selectedRadio] ==
                            OrderModes.delivery.orderMode)
                          Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: SizedBox(
                                    child: CustomTextField(
                                  hintText: "Delivery Location",
                                  isNecessary: true,
                                  controller: _deliveryLocationController,
                                  validator: validateField,
                                )),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        SizedBox(
                            height: 150,
                            child: CustomTextField(
                              focusNode: FocusNode(),
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
                              if (widget.outletModel.service[selectedRadio] ==
                                      OrderModes.delivery.orderMode &&
                                  !_formKey.currentState!.validate()) {
                                showSnackBar(
                                    'Please give all the inputs correctly');
                              } else {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              index: 1,
                                            )),
                                    (route) => false);
                                cartStore.emptyCart();
                              }
                            }),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: lBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(
                              "Make Order",
                              style:
                                  MyFonts.w400.setColor(kButtonText).size(18),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
