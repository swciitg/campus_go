import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/outlet/edit_item_page.dart';
import 'package:campus_go/stores/cart_store.dart';
import 'package:campus_go/stores/user_store.dart';
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
    var userStore = context.read<UserStore>();
    ViewType viewType = userStore.viewType;
    return Observer(
      builder: (context) => Padding(
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
                              color: kWhite,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              viewType == ViewType.admin
                                  ? "Outlet Menu"
                                  : "Explore Menu",
                              style: MyFonts.w600.setColor(kWhite).size(18),
                            )
                          ],
                        ),
                        Text(
                          viewType == ViewType.admin
                              ? "Click \"Edit\" for editing info"
                              : "Click \"ADD\" for adding to cart",
                          style: MyFonts.w300.setColor(kWhite).size(10),
                        ),
                      ]),
                  if (viewType == ViewType.user)
                    Container(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "${cartStore.totalItems} ",
                              style: MyFonts.w500.setColor(kWhite).size(12),
                            ),
                            TextSpan(
                              text:
                                  cartStore.totalItems == 1 ? "Item" : "Items",
                              style: MyFonts.w500.setColor(kWhite).size(12),
                            ),
                            TextSpan(
                              text: " Added",
                              style: MyFonts.w500.setColor(kWhite).size(12),
                            ),
                          ]),
                        )),
                  if (viewType == ViewType.admin)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditItemPage()));
                      },
                      child: Container(
                        // height: 32,
                        // width: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: lBlue),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Text("Add Item", style: MyFonts.w500.setColor(kButtonText).size(14,)),
                        )
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
