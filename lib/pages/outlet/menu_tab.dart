import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/stores/cart_store.dart';
import 'package:campus_go/widgets/outlet/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MenuTab extends StatefulWidget {
  final OutletModel outletModel;
  const MenuTab({super.key, required this.outletModel});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    var cartStore = context.read<CartStore>();
    cartStore.calcTotalItems();
    return Observer(
      builder: (context)=>Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.menu_book_outlined,
                              color: kBlack,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Explore Menu",
                              style: MyFonts.w600.setColor(kBlack).size(18),
                            )
                          ],
                        ),
                        Text(
                          "Click \"ADD\" for adding to cart",
                          style: MyFonts.w300.setColor(kBlack).size(10),
                        ),
                      ]),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${cartStore.totalItemsAdded} Items Added",
                      style: MyFonts.w500.setColor(kBlack).size(12),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            MenuTile(
              itemModel: ItemModel(
                  id: "cb",
                  name: "Chicken Biryani",
                  price: "160",
                  category: "NON-VEG",
                  offeringOutlet: "offeringOutlet"),
                  isOpen: widget.outletModel.status,
            ),
            MenuTile(
              itemModel: ItemModel(
                  id: "pc",
                  name: "Papdi Chaat",
                  price: "160",
                  category: "VEG",
                  offeringOutlet: "offeringOutlet"),
                  isOpen: widget.outletModel.status,
            ),
          ]),
        ),
      ),
    );
  }
}
