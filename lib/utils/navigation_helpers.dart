import 'package:flutter/material.dart';

void navigateWithSlide(
  BuildContext context,
  Widget page, {
  bool toLeft = true,
  bool pop = false,
  String? routeName, // novo parâmetro opcional
}) {
  final route = PageRouteBuilder(
    settings: routeName != null ? RouteSettings(name: routeName) : null,
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
  );

  if (pop) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 50), () {
      Navigator.of(context).push(route);
    });
  } else {
    Navigator.of(context).pushReplacement(route);
  }
}

void navigateWithFade(
  BuildContext context,
  Widget page, {
  bool pop = false,
  String? routeName,
}) {
  final route = PageRouteBuilder(
    settings: routeName != null ? RouteSettings(name: routeName) : null,
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );

  if (pop) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 50), () {
      Navigator.of(context).push(route);
    });
  } else {
    Navigator.of(context).pushReplacement(route);
  }
}
