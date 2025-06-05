import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/main.dart';
import 'package:this_is_gustavo/themes/colors.dart';

class AppBarDecorations {
  static AppBar buildAppBar(BuildContext context, String title) {
    final lang = AppStrings.currentLanguage.value;
    return AppBar(
      leading: Padding(padding: const EdgeInsets.all(2), child: Image.asset('assets/images/logo.png')),
      leadingWidth: 200,
      backgroundColor: AppColors.primary,
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(
          color: Colors.white,
          icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode),
          onPressed: () {
            themeModeNotifier.value =
                Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
          },
        ),
        IconButton(
          icon: Image.asset(
            lang == AppLanguage.pt ? 'assets/icons/br.png' : 'assets/icons/us.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            AppStrings.currentLanguage.value = lang == AppLanguage.pt ? AppLanguage.en : AppLanguage.pt;
          },
        ),
        SizedBox(width: 30),
      ],
    );
  }
}
