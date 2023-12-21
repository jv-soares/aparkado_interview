import 'dart:math';

import 'package:aparkado_interview/layout/colored_list.dart';
import 'package:aparkado_interview/layout/colored_tile.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                child: Container(
                  color: Colors.amber,
                ),
                maxHeight: 400,
                minHeight: 0,
              ),
            ),
            SliverList.list(
              children: blueList.map((color) => ColoredTile(color)).toList(),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              children: greenList.map((color) => ColoredTile(color)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
