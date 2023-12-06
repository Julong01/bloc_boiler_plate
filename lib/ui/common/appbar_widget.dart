import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

AppBar appBar({required String title}) {
  return AppBar(
    title: AutoSizeText(
      title,
    ),
  );
}
