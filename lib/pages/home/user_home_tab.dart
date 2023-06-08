import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/widgets/home/outlet_tile.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';

class UserHomeTab extends StatefulWidget {
  const UserHomeTab({super.key});

  @override
  State<UserHomeTab> createState() => _UserHomeTabState();
}

class _UserHomeTabState extends State<UserHomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'Out',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          // decoration: TextDecoration.underline,
                          // decorationThickness: 2,
                          fontSize: 18,
                          color: kBlack,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "lets Available",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: kBlack,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          // SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Container(
              height: 2,
              width: 30,
              color: kBlack,
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          ListView.builder(
            itemCount: outletModels.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
            return OutletTile(outletID: outletModels.keys.elementAt(index));
          })
        ],
      ),
    );
  }
}
