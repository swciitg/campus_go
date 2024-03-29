import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/pages/outlet/edit_item_page.dart';
import 'package:campus_go/stores/cart_store.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class MenuTile extends StatefulWidget {
  final ItemModel itemModel;
  final bool isOpen;
  const MenuTile({super.key, required this.itemModel, required this.isOpen});

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  @override
  Widget build(BuildContext context) {
    var cartStore = context.read<CartStore>();
    var userStore = context.read<UserStore>();
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: kAppBarGrey),
              borderRadius: BorderRadius.circular(8),color: kAppBarGrey),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
            child: Row(children: [
              Expanded(
                // flex: 7,
                child: Container(
                  color: kAppBarGrey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kWhite).size(16),
                        ),
                        // const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Price: ",
                                    style:
                                        MyFonts.w300.setColor(kWhite).size(12),
                                  ),
                                  Text(
                                    "₹ ${widget.itemModel.price}",
                                    style:
                                        MyFonts.w500.setColor(kWhite).size(12),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                      height: 8,
                                      width: 8,
                                      child: SvgPicture.asset(
                                          widget.itemModel.category == "VEG"
                                              ? "assets/images/veg.svg"
                                              : "assets/images/nonveg.svg")),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.itemModel.category,
                                    style:
                                        MyFonts.w300.setColor(kWhite).size(12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              userStore.viewType == ViewType.user
                  ? widget.isOpen
                      ? cartStore.cart.containsKey(widget.itemModel.id)
                          ? GestureDetector(
                              onTap: () {
                                cartStore.removeItem(widget.itemModel.id);
                              },
                              child: Container(
                                width: 74,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: kRed,
                                    // border: Border.all(color: kRed),
                                    borderRadius: BorderRadius.circular(4)),
                                alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.close_outlined,
                                        size: 12,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Remove",
                                        style: MyFonts.w500
                                            .setColor(kButtonText)
                                            .size(12),
                                      )
                                    ]),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                cartStore.addItem(widget.itemModel.id);
                              },
                              child: Container(
                                width: 74,
                                height: 32,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: lBlue,
                                    border: Border.all(color: lBlue),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  "Add",
                                  style: MyFonts.w500.setColor(kButtonText).size(12),
                                ),
                              ),
                            )
                      : Container()
                  : SizedBox(
                      width: 66,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditItemPage(itemModel: widget.itemModel,)));
                            },
                            child: const SizedBox(
                              height: 30,
                              width: 25,
                              child: Icon(
                                Icons.edit_outlined,
                                size: 28,
                                color: lBlue,
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: kRed),
                            child: const Icon(
                              Icons.clear_outlined,
                              color: kButtonText,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
