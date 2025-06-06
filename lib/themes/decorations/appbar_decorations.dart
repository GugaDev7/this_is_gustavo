import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/main.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarDecorations {
  static AppBar buildAppBar(BuildContext context, String title) {
    final lang = AppStrings.currentLanguage.value;
    final iconSize = 30.0;
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.primaryDark,
      title: Image.asset('assets/images/logo.png', height: 100, fit: BoxFit.contain),
      centerTitle: false,
      actions: [
        TextButton(onPressed: () {}, child: Text(AppStrings.get('homeTitle'), style: TextStyles.title)),
        SizedBox(width: 800),
        IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/my_icon.svg')),
        IconButton(
          iconSize: iconSize,
          color: Colors.white,
          icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode),
          onPressed: () {
            themeModeNotifier.value =
                Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
          },
        ),
        IconButton(
          iconSize: iconSize,
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
