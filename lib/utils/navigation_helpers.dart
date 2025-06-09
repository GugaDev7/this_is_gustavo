import 'package:flutter/material.dart';

void navigateWithSlide(
  BuildContext context,
  Widget page, {
  bool toLeft = true,
}) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (_, animation, __, child) {
        final begin = Offset(toLeft ? 1.0 : -1.0, 0.0);
        final end = Offset.zero;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.ease));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  );
}
