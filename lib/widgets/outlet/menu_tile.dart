import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class MenuTile extends StatefulWidget {
  final bool veg;
  final bool isAdded;
  const MenuTile({super.key, required this.veg, required this.isAdded});

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
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
                                SizedBox(
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
            widget.isAdded
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 74,
                      height: 32,
                      decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBlack),
                          borderRadius: BorderRadius.circular(4)),
                          alignment: Alignment.center,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            const Icon(Icons.close_outlined,size: 12,),
                            const SizedBox(width: 2,),
                            Text("Remove",style: MyFonts.w500.setColor(kBlack).size(12),)
                          ]),
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 74,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kBlack,
                          border: Border.all(color: kBlack),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "Add",
                        style: MyFonts.w500.setColor(kWhite).size(12),
                      ),
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
