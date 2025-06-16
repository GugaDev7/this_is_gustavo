import 'package:flutter/material.dart';
import 'themes/app_themes.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/about_screen.dart';
import 'view/screens/projects_screen.dart';
import 'view/screens/contact_screen.dart';
import 'core/app_scaffold.dart';

// Notificador global para alternar o tema
final themeModeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: mode,
          initialRoute: '/home',
          routes: {
            '/home': (context) => const AppScaffold(child: HomeScreen()),
            '/about': (context) => const AppScaffold(child: AboutScreen()),
            '/projects':
                (context) => const AppScaffold(child: ProjectsScreen()),
            '/contact': (context) => const AppScaffold(child: ContactScreen()),
          },
        );
      },
    );
  }
}
