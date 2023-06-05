import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/pages/outlet/outlet_page.dart';
import 'package:flutter/material.dart';

class OutletTile extends StatefulWidget {
  final String outletName;
  final String location;
  final bool veg;
  final bool open;
  const OutletTile(
      {super.key,
      required this.outletName,
      required this.location,
      required this.veg,
      required this.open});

  @override
  State<OutletTile> createState() => _OutletTileState();
}

class _OutletTileState extends State<OutletTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: ((){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OutletPage()));
        }),
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
                          widget.outletName,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.w600.setColor(kBlack).size(16),
                        ),
                        // const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.pin_drop_outlined,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(widget.location,
                                  overflow: TextOverflow.ellipsis,
                                  style: MyFonts.w300.setColor(kBlack).size(12)),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                width: 80,
                color: kWhite,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.local_dining_outlined,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.veg == false ? "VEG" : "NON-VEG",
                          style: MyFonts.w500.setColor(kBlack).size(12),
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
                          size: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.open == true ? "OPEN" : "CLOSE",
                          style: MyFonts.w500.setColor(kBlack).size(12),
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
    );
  }
}
