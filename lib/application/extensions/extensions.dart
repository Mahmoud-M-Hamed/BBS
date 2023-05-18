import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );

  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

extension NonNullString on String? {
  String orNull() {
    if (this == null) {
      return '';
    }
    return this!;
  }
}

extension NonNullInteger on int? {
  int orNull() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}

extension NonNullDouble on double? {
  double orNull() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}
