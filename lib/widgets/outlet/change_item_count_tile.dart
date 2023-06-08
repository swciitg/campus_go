import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class ItemCountTile extends StatefulWidget {
  final String itemID;
  final int? count;
  final bool editing;
  const ItemCountTile({
    super.key,
    required this.editing,
    required this.itemID, this.count,
  });

  @override
  State<ItemCountTile> createState() => _ItemCountTileState();
}

class _ItemCountTileState extends State<ItemCountTile> {
  @override
  Widget build(BuildContext context) {
    ItemModel itemModel = itemModels[widget.itemID]!;
    
     
    var cartStore = context.read<CartStore>();
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: kBlack),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Row(children: [
              Expanded(
                // flex: 7,
                child: Container(
                  color: kWhite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kBlack).size(16),
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
                                        MyFonts.w300.setColor(kBlack).size(12),
                                  ),
                                  Text(
                                    "₹ ${itemModel.price}",
                                    style:
                                        MyFonts.w500.setColor(kBlack).size(12),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                      height: 8,
                                      width: 8,
                                      child: SvgPicture.asset(
                                          itemModel.category ==
                                                  FoodCategories.veg.category
                                              ? "assets/images/veg.svg"
                                              : "assets/images/nonveg.svg")),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    itemModel.category,
                                    style:
                                        MyFonts.w300.setColor(kBlack).size(12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              widget.editing
                  ? Container(
                      width: 75,
                      height: 25,
                      decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBlack),
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.center,
                      child: Row(children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              cartStore.decreaseItemCount(itemModel.id);
                            });
                          }),
                          child: Container(
                            color: kBlack,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.remove_outlined,
                              color: kWhite,
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          color: kWhite,
                          alignment: Alignment.center,
                          child: Text(
                            (cartStore.cart[itemModel.id] ?? 0)
                                .toString(),
                            style: MyFonts.w500.setColor(kBlack).size(14),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              cartStore.increaseItemCount(itemModel.id);
                            });
                          },
                          child: Container(
                            color: kBlack,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add_outlined,
                              color: kWhite,
                            ),
                          ),
                        )),
                      ]),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "x ",
                            style: MyFonts.w500.setColor(kBlack).size(16),
                          ),
                          TextSpan(
                            text: (widget.count??0).toString(),
                            style: MyFonts.w500.setColor(kBlack).size(18),
                          )
                        ]),
                      ),
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
