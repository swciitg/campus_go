import 'package:campus_go/widgets/home/outlet_tile.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutletTile(outletName: "Lohit Canteen",location: "Lohit Hostel", veg: true,open: true,),
      ],
    );
  }
}