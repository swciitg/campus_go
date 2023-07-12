import 'package:campus_go/globals/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../globals/my_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final String? value;
  final void Function(String)? onChanged;
  final bool isNecessary;
  final TextEditingController? controller;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final bool? isEnabled;
  final Icon? prefixIcon;
  final int? maxLines;
  final bool? expands;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.validator,
      this.value,
      this.onChanged,
      required this.isNecessary,
      this.prefixIcon,
      this.inputType,
      this.controller,
      this.onTap,
       this.isEnabled,
      this.focusNode, this.maxLines, this.expands, this.textAlignVertical, this.textInputAction, this.inputFormatters});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled ?? true,
      readOnly: widget.onTap != null,
      style: MyFonts.w500.size(14).copyWith(color: kWhite),
      validator: widget.validator,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: lBlue,
      textInputAction: widget.textInputAction ,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      initialValue: widget.value == 'null' ? '' : widget.value,
      keyboardType: widget.inputType,
      maxLines: widget.maxLines,
      expands: widget.expands??false,
      textAlign: TextAlign.left,
      inputFormatters: widget.inputFormatters??[],
      textAlignVertical: widget.textAlignVertical??TextAlignVertical.center,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: kWhite,
        suffixIcon: widget.isEnabled==false? const Icon(Icons.lock_outline_rounded):const Icon(null),
        suffixIconColor: kWhite,
        errorStyle: MyFonts.w500,
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.hintText,
                style: MyFonts.w400.size(14).setColor(kWhite),
              ),
              if (widget.isNecessary)
                TextSpan(
                  text: ' * ',
                  style: MyFonts.w500.size(16).setColor(kRed),
                ),
            ],
          ),
        ),
        labelStyle: MyFonts.w500.size(14).setColor(kTabText),
        hintStyle: MyFonts.w500.size(14).setColor(kTabText),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kfocusColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kfocusColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kfocusColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
      
    );
  }
}
