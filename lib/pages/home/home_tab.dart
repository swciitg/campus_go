import 'package:campus_go/widgets/home/outlet_tile.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                padding: const EdgeInsets.only(left: 0),
                child: Container(height: 2,width: 30,color: kBlack,),
              ),
              const SizedBox(
                height: 12,
              ),
              OutletTile(outletName: "outletName", location: "location", veg: false, open: true),
             
            ],
          ),
        );
  }
}
