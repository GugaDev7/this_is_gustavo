import 'package:flutter/material.dart';

class ResponsiveRowColumn extends StatelessWidget {
  final bool useRow;
  final Widget left;
  final Widget right;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;

  const ResponsiveRowColumn({
    super.key,
    required this.useRow,
    required this.left,
    required this.right,
    this.spacing = 40,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return useRow
        ? Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Expanded(child: left),
            SizedBox(width: spacing),
            SizedBox(width: 450, child: right),
          ],
        )
        : Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [right, SizedBox(height: spacing / 2), left],
        );
  }
}
