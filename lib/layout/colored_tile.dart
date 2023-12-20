import 'package:flutter/material.dart';

class ColoredTile extends StatelessWidget {
  final Color color;

  const ColoredTile(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: color, height: 100);
  }
}
