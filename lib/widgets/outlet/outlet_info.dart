import 'package:campus_go/models/outlet_model.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';

class OutletInfo extends StatefulWidget {
  final OutletModel outletModel;
  const OutletInfo({super.key, required this.outletModel});

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}

class _OutletInfoState extends State<OutletInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.outletModel.outletName,
                    style: MyFonts.w600.setColor(kWhite).size(24),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.pin_drop_outlined,
                          color: kGrey2,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(widget.outletModel.location,
                            overflow: TextOverflow.ellipsis,
                            style: MyFonts.w300.setColor(kWhite).size(12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              height: 2,
              width: 30,
              color: kWhite,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 18,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      const Icon(
                        Icons.phone_outlined,
                        color: kGrey2,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "+91 ${widget.outletModel.phoneNumber}",
                        style: MyFonts.w300.setColor(kWhite).size(12),
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
                    SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                            widget.outletModel.status ? "OPEN" : "CLOSED",
                            style: MyFonts.w500.setColor(kWhite).size(12),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: kWhite,
            thickness: 1,
            height: 1,
          ),
        ]);
  }
}
