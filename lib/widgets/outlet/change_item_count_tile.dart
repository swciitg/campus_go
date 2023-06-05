import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class ItemCountTile extends StatefulWidget {
  final bool veg;
  final bool editing;
  const ItemCountTile({super.key, required this.veg, required this.editing});

  @override
  State<ItemCountTile> createState() => _ItemCountTileState();
}

class _ItemCountTileState extends State<ItemCountTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        "Chicken Biryani",
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
                                  style: MyFonts.w300.setColor(kBlack).size(12),
                                ),
                                Text(
                                  "₹ " + "160",
                                  style: MyFonts.w500.setColor(kBlack).size(12),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                    height: 8,
                                    width: 8,
                                    child: SvgPicture.asset(widget.veg
                                        ? "assets/images/veg.svg"
                                        : "assets/images/nonveg.svg")),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.veg ? "VEG" : "NON-VEG",
                                  style: MyFonts.w300.setColor(kBlack).size(12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            widget.editing? Container(
              width: 75,
              height: 25,
              decoration: BoxDecoration(
                  color: kWhite,
                  border: Border.all(color: kBlack),
                  borderRadius: BorderRadius.circular(4)),
              alignment: Alignment.center,
              child: Row(children: [
                Expanded(
                    child: Container(
                  color: kBlack,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.remove_outlined,
                    color: kWhite,
                  ),
                )),
                Expanded(
                    child: Container(
                  color: kWhite,
                  alignment: Alignment.center,
                  child: Text("1",style: MyFonts.w500.setColor(kBlack).size(14),) ,
                )),
                Expanded(
                    child: Container(
                  color: kBlack,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_outlined,
                    color: kWhite,
                  ),
                )),
              ]),
            ):Padding(
              padding: const EdgeInsets.only(right: 18),
              child: RichText(text: TextSpan(children: [
                TextSpan(text: "x ",style: MyFonts.w500.setColor(kBlack).size(16),),
                TextSpan(text: "1",style: MyFonts.w500.setColor(kBlack).size(18),)
              ]),),
            )
          ]),
        ),
      ),
    );
  }
}
