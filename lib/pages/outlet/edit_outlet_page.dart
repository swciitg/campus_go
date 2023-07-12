import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/models/outlet_model.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../functions/utility/validator.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/common/custom_text_field.dart';

class EditOutletPage extends StatefulWidget {
  final OutletModel? outletModel;
  const EditOutletPage({super.key, this.outletModel});

  @override
  State<EditOutletPage> createState() => _EditOutletPageState();
}

class _EditOutletPageState extends State<EditOutletPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: appBar(context, "Edit Outlet",
            displayBackButton: true,
            displayProfileIcon: false,
            displayLogoutButton: false),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Confirm Changes",
                        style: MyFonts.w400.setColor(kWhite).size(18),
                      ),
                    ),
                  ),
                ),
              ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Form(
                    key: _formKey,
                    child: Column(children: [
                      CustomTextField(
                        hintText: "Outlet Name",
                        isNecessary: true,
                        controller: _nameController,
                        isEnabled: true,
                        inputType: TextInputType.text,
                        validator: validateField,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: "Phone No.",
                        isNecessary: true,
                        controller: _phoneController,
                        isEnabled: true,
                        inputType: TextInputType.phone,
                        validator: validateField,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: "Outlet Location",
                        isNecessary: true,
                        controller: _locationController,
                        isEnabled: true,
                        inputType: TextInputType.text,
                        validator: validateField,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ])),
                Text(
                  "Select Outlet Status",
                  style: MyFonts.w500.setColor(kBlack).size(16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRadio = 0;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Radio(
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              setState(() {
                                selectedRadio = val!;
                              });
                            },
                            activeColor: kBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Open',
                          style: MyFonts.w400.setColor(kBlack).size(12),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRadio = 1;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              setState(() {
                                selectedRadio = val!;
                              });
                            },
                            activeColor: kBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Close',
                          style: MyFonts.w400.setColor(kBlack).size(12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
