import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/outlet/menu_tab.dart';
import 'package:campus_go/widgets/outlet/outlet_info.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';

class AdminHomeTab extends StatefulWidget {
  final OutletModel outletModel;
  const AdminHomeTab({super.key, required this.outletModel});

  @override
  State<AdminHomeTab> createState() => _AdminHomeTabState();
}

class _AdminHomeTabState extends State<AdminHomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       OutletInfo(outletModel: widget.outletModel),
       MenuTab(outletModel: widget.outletModel),
      ],
    );
  }
}