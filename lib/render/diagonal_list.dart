import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiagonalList extends MultiChildRenderObjectWidget {
  const DiagonalList({super.key, required super.children});

  @override
  RenderDiagonal createRenderObject(BuildContext context) => RenderDiagonal();
}

class RenderDiagonal extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, DiagonalParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, DiagonalParentData> {
  RenderDiagonal({List<RenderBox>? children}) {
    addAll(children);
  }

  @override
  void performLayout() {
    RenderBox? child = firstChild;

    if (child == null) return;

    final childWidth = constraints.maxWidth / childCount;

    double totalWidth = 0.0;
    double totalHeight = 0.0;

    while (child != null) {
      child.layout(
        BoxConstraints.tightFor(width: childWidth),
        parentUsesSize: true,
      );
      final childParentData = child.parentData! as DiagonalParentData;
      childParentData.offset = Offset(totalWidth, totalHeight);
      totalWidth += childWidth;
      totalHeight += child.size.height;
      child = childParentData.nextSibling;
    }

    size = constraints.constrain(Size(totalWidth, totalHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! DiagonalParentData) {
      child.parentData = DiagonalParentData();
    }
  }
}

class DiagonalParentData extends ContainerBoxParentData<RenderBox> {}
