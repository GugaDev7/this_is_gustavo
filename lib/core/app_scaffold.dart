import 'package:flutter/material.dart';
import 'package:this_is_gustavo/utils/navigation_button.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: const NavigationFloatingButton(),
    );
  }
}
