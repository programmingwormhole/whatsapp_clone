import 'package:flutter/material.dart';

PopupMenuItem<dynamic> popupMenuItem(
    {required String title,
      Widget? child,
      void Function()? onTap, required int value}) {
  return PopupMenuItem(
    value: value,
    child: Text(title),
  );
}
