import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack_style.dart';

class GSVStack extends StatelessWidget {
  final List<Widget> children;
  final GSSpaces? space;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final bool isReversed;
  final VerticalDirection verticalDirection;
  const GSVStack({
    super.key,
    this.space,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.isReversed = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildrenList = [];

    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last) {
        spacedChildrenList.add(
          SizedBox(height: GSVStackStyle.space[space]?.gap),
        );
      }
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: isReversed
          ? spacedChildrenList.reversed.toList()
          : spacedChildrenList,
    );
  }
}
