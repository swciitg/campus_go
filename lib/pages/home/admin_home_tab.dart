import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/pages/outlet/edit_outlet_page.dart';
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
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditOutletPage(outletModel: widget.outletModel,)));
        },
        child: Container(
          height: 56,
          width: 116,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: kBlack),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "Outlet",
                style: MyFonts.w500.setColor(kWhite).size(14),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutletInfo(outletModel: widget.outletModel),
          MenuTab(outletModel: widget.outletModel),
        ],
      ),
    );
  }
}
