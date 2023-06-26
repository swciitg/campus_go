import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/admin_model.dart';
import 'package:campus_go/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/ui/appbar.dart';

class OwnedOutletsPage extends StatefulWidget {
  final AdminModel adminModel;
  const OwnedOutletsPage({super.key, required this.adminModel});

  @override
  State<OwnedOutletsPage> createState() => _OwnedOutletsPageState();
}

class _OwnedOutletsPageState extends State<OwnedOutletsPage> {
  int selectedOutlet=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Choose Outlet",
          displayProfileIcon: false, displayBackButton: false),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: (() {
                // onFormSubmit();
                 Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage(outletModel: outletModels['a'],)), (route) => false);
              }),
              style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Proceed",
                style: MyFonts.w400.setColor(kWhite).size(18),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Center(
            child: ListView.builder(
              itemCount: widget.adminModel.outletsOwned.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
              return Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOutlet=index;
                      });
                    },
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: kBlack.withOpacity(selectedOutlet==index?1:0.25),width: selectedOutlet==index?2:1),color: kWhite,borderRadius: BorderRadius.circular(8)),
                      child: Text(widget.adminModel.outletsOwned[index],style: MyFonts.w500.setColor(kBlack).size(24),),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}