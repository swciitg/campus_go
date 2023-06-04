import 'package:campus_go/functions/utility/validator.dart';
import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/widgets/profile/custom_text_field.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

import '../functions/utility/show_snackbar.dart';
import '../globals/my_fonts.dart';

class ProfileSetup extends StatefulWidget {
  static String id = "/ps";
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _outlookController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController.text = "Chanchal Yadav";
    _outlookController.text = "y.chanchal@iitg.ac.in";
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onFormSubmit() async {
      if (!_formKey.currentState!.validate()) {
        showSnackBar('Please give all the inputs correctly');
        return;
      } else {
        

        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    }
    return Scaffold(
      appBar: appBar(context, "Profile Setup",displayProfileIcon: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: (() {
              onFormSubmit();
            }),
            style: ElevatedButton.styleFrom(
                backgroundColor: kBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              "Submit",
              style: MyFonts.w400.setColor(kWhite).size(18),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'NOTE:',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          color: kBlack,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text:
                          ' Name & Email field cannot be changed as they are based on your outlook account information',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: kBlack,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Form(
              key: _formKey,
                child: Column(children: [
              CustomTextField(
                hintText: "Full Name",
                isNecessary: false,
                prefixIcon: const Icon(Icons.person_outline_outlined),
                controller: _nameController,
                isEnabled: false,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Email",
                isNecessary: false,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: _outlookController,
                isEnabled: false,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Contact No.",
                isNecessary: true,
                prefixIcon: const Icon(Icons.phone_outlined),
                controller: _contactController,
                isEnabled: true,
                inputType: TextInputType.phone,
                validator: validateField,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: "Alternate Email",
                isNecessary: true,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: _emailController,
                isEnabled: true,
                inputType: TextInputType.emailAddress,
                validator: validateField,
              ),
              Container(
                height: 96,
              )
            ]))
          ]),
        ),
      ),
    );
  }
}
