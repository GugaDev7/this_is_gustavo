import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/main.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/view/screens/about_screen.dart';
import 'package:this_is_gustavo/view/screens/contact_screen.dart';
import 'package:this_is_gustavo/view/screens/home_screen.dart';
import 'package:this_is_gustavo/view/screens/projects_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = AppStrings.currentLanguage.value;

    return Drawer(
      surfaceTintColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : AppColors.primary,
            ),
            child: Center(child: SvgPicture.asset('assets/images/logo.svg')),
          ),
          // Navegação
          ListTile(
            title: Text(AppStrings.get('homeTitle')),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text(AppStrings.get('aboutMe')),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
          ListTile(
            title: Text(AppStrings.get('projects')),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ProjectsScreen()),
              );
            },
          ),
          ListTile(
            title: Text(AppStrings.get('contact')),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ContactScreen()),
              );
            },
          ),
          const Divider(),
          // Alternar tema
          ListTile(
            leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            title: Text(AppStrings.get('themeMode')),
            onTap: () {
              themeModeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
              Navigator.of(context).pop();
            },
          ),
          // Alternar idioma
          ListTile(
            leading: Image.asset(
              lang == AppLanguage.pt
                  ? 'assets/icons/br.png'
                  : 'assets/icons/us.png',
              width: 24,
              height: 24,
            ),
            title: Text(lang == AppLanguage.pt ? 'Português' : 'English'),
            onTap: () {
              AppStrings.changeLanguage(
                lang == AppLanguage.pt ? AppLanguage.en : AppLanguage.pt,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
