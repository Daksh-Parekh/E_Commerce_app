import 'package:flutter/material.dart';

extension Mysize on int {
  SizedBox get ofHeight => SizedBox(
    height: toDouble(),
  );
  SizedBox get ofWidth => SizedBox(
    width: toDouble(),
  );
}

extension Tcase on String{
  String get tcase => replaceFirst(
    this[0],
    this[0].toUpperCase(),
  );
}