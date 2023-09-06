import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/outlet/outlet_page.dart';
import 'package:campus_go/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class OutletTile extends StatefulWidget {
  final String outletID;
  const OutletTile({
    super.key,
    required this.outletID,
  });

  @override
  State<OutletTile> createState() => _OutletTileState();
}

class _OutletTileState extends State<OutletTile> {
  @override
  Widget build(BuildContext context) {
    OutletModel outletModel = outletModels[widget.outletID]!;
    var cartStore = context.read<CartStore>();

    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: (() {
            cartStore.emptyCart();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OutletPage(
                      outletModel: outletModel,
                    )));
          }),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: kAppBarGrey),
                borderRadius: BorderRadius.circular(8),
                color: kAppBarGrey),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(children: [
                Expanded(
                  // flex: 7,
                  child: Container(
                    // color: kWhite,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            outletModel.outletName,
                            overflow: TextOverflow.ellipsis,
                            style: MyFonts.w600.setColor(kWhite).size(16),
                          ),
                          // const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.pin_drop_outlined,
                                  color: kGrey2,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(outletModel.location,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        MyFonts.w300.setColor(kWhite).size(12)),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                Container(
                  // color: kWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.local_dining_outlined,
                            color: kGrey2,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            outletModel.category,
                            style: MyFonts.w500.setColor(kWhite).size(12),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: kGrey2,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            outletModel.status ? "OPEN" : "CLOSE",
                            style: MyFonts.w500.setColor(kWhite).size(12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
