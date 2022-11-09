import 'package:flutter/material.dart';

Widget Customtext(
    {required String text,
    required Color Colorr,
    required double size,
    required FontWeight fontsize}) {
  return Text(
    text,
    style: TextStyle(fontSize: size, color: Colorr, fontWeight: fontsize),
  );
}
