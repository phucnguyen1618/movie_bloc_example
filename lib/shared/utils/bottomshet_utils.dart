import 'package:flutter/material.dart';

class BottomSheetUtils {
  static Future<void> showGeneralBottomSheet(
      BuildContext context, Widget child) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      )),
      context: context,
      builder: (context) => child,
    );
  }
}
