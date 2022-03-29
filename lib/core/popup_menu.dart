import 'package:flutter/material.dart';

PopupMenuItem buildPopupMenuItem(
  String title,
  VoidCallback onTab,
) {
  return PopupMenuItem(
    child: InkWell(
      onTap: onTab,
      child: Text(title),
    ),
  );
}
