import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/main.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_is_gustavo/utils/navigation_helpers.dart';
import 'package:this_is_gustavo/view/screens/about_screen.dart';
import 'package:this_is_gustavo/view/screens/contact_screen.dart';
import 'package:this_is_gustavo/view/screens/home_screen.dart';
import 'package:this_is_gustavo/view/screens/projects_screen.dart';

class AppBarDecorations {
  static AppBar buildAppBar(BuildContext context, {bool showDrawer = false}) {
    final iconSize = 30.0;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0,
      // Mostra ícone do menu apenas se Drawer estiver visível
      leading:
          showDrawer
              ? Builder(
                builder:
                    (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              )
              : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          GestureDetector(
            child: SvgPicture.asset('assets/images/logo.svg'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/home') {
                navigateWithFade(context, HomeScreen(), routeName: '/home');
              }
            },
          ),
          SizedBox(width: 8),
          // Ícone de tema
          GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/bulb.svg',
              height: 90,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark ? Colors.yellow : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            onTap: () {
              themeModeNotifier.value =
                  Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      centerTitle: false,
      // Actions só aparecem se Drawer não estiver visível
      actions:
          showDrawer
              ? []
              : [
                Builder(
                  builder: (context) {
                    final showTexts = MediaQuery.of(context).size.width > 1000;
                    return ValueListenableBuilder<AppLanguage>(
                      valueListenable: AppStrings.currentLanguage,
                      builder: (context, lang, _) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Botões de navegação só em telas grandes
                            if (showTexts) ...[
                              TextButton(
                                onPressed: () {
                                  if (ModalRoute.of(context)?.settings.name != '/home') {
                                    navigateWithFade(context, HomeScreen(), routeName: '/home');
                                  }
                                },
                                child: Text(AppStrings.get('homeTitle'), style: TextStyles.title),
                              ),
                              SizedBox(width: 16),
                              TextButton(
                                onPressed: () {
                                  navigateWithFade(context, AboutScreen());
                                },
                                child: Text(AppStrings.get('aboutMe'), style: TextStyles.title),
                              ),
                              SizedBox(width: 16),
                              TextButton(
                                onPressed: () {
                                  navigateWithFade(context, ProjectsScreen());
                                },
                                child: Text(AppStrings.get('projects'), style: TextStyles.title),
                              ),
                              SizedBox(width: 16),
                              TextButton(
                                onPressed: () {
                                  navigateWithFade(context, ContactScreen());
                                },
                                child: Text(AppStrings.get('contact'), style: TextStyles.title),
                              ),
                              SizedBox(width: 32),
                            ],
                            // Botão de alternar tema
                            IconButton(
                              iconSize: iconSize,
                              color: Colors.white,
                              icon: Icon(
                                Theme.of(context).brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode,
                              ),
                              onPressed: () {
                                themeModeNotifier.value =
                                    Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
                              },
                            ),
                            // Botão de alternar idioma
                            IconButton(
                              iconSize: iconSize,
                              icon: Image.asset(
                                lang == AppLanguage.pt ? 'assets/icons/br.png' : 'assets/icons/us.png',
                                width: 24,
                                height: 24,
                              ),
                              onPressed: () {
                                AppStrings.currentLanguage.value =
                                    lang == AppLanguage.pt ? AppLanguage.en : AppLanguage.pt;
                              },
                            ),
                            SizedBox(width: 30),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
    );
  }
}
