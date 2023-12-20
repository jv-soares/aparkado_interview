import 'package:flutter/material.dart';

final blueList = List.generate(
  6,
  (index) => Colors.blue[(index + 1) * 100] ?? Colors.white,
);

final greenList = List.generate(
  9,
  (index) => Colors.green[(index + 1) * 100] ?? Colors.white,
);
