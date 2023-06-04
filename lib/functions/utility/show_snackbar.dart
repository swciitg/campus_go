import 'package:flutter/material.dart';

import '../../globals/my_fonts.dart';
import '../../main.dart';

void showSnackBar(String message) {
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message, style: MyFonts.w500),
    ),
  );
}