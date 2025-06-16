import 'package:flutter/material.dart';
import 'package:this_is_gustavo/view/screens/about_screen.dart';
import 'package:this_is_gustavo/view/screens/contact_screen.dart';
import 'package:this_is_gustavo/view/screens/home_screen.dart';
import 'package:this_is_gustavo/view/screens/projects_screen.dart';
import 'package:this_is_gustavo/utils/navigation_helpers.dart';

class NavigationFloatingButton extends StatelessWidget {
  const NavigationFloatingButton({super.key});

  void navigateToNextPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    switch (currentRoute) {
      case '/home':
        navigateWithFade(context, AboutScreen(), routeName: '/about');
        break;
      case '/about':
        navigateWithFade(context, ProjectsScreen(), routeName: '/projects');
        break;
      case '/projects':
        navigateWithFade(context, ContactScreen(), routeName: '/contact');
        break;
      case '/contact':
        navigateWithFade(context, HomeScreen(), routeName: '/home');
        break;
      default:
        // Se não tiver rota definida, vai para About
        navigateWithFade(context, AboutScreen(), routeName: '/about');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => navigateToNextPage(context),
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }
}
