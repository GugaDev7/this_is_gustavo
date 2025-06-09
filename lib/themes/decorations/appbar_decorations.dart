import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/main.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarDecorations {
  static AppBar buildAppBar(BuildContext context, String title) {
    final iconSize = 30.0;
    return AppBar(
      toolbarHeight: 100,
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppColors.surfaceDark
              : AppColors.primary,
      title: Row(
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/bulb.svg',
            height: 90,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.yellow
                  : Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        Builder(
          builder: (context) {
            final showTexts = MediaQuery.of(context).size.width > 1010;
            return ValueListenableBuilder<AppLanguage>(
              valueListenable: AppStrings.currentLanguage,
              builder: (context, lang, _) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showTexts) ...[
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.get('homeTitle'),
                          style: TextStyles.title,
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.get('aboutMe'),
                          style: TextStyles.title,
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.get('projects'),
                          style: TextStyles.title,
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.get('contact'),
                          style: TextStyles.title,
                        ),
                      ),
                      SizedBox(width: 32),
                    ],
                    IconButton(
                      iconSize: iconSize,
                      color: Colors.white,
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                      onPressed: () {
                        themeModeNotifier.value =
                            Theme.of(context).brightness == Brightness.dark
                                ? ThemeMode.light
                                : ThemeMode.dark;
                      },
                    ),
                    IconButton(
                      iconSize: iconSize,
                      icon: Image.asset(
                        lang == AppLanguage.pt
                            ? 'assets/icons/br.png'
                            : 'assets/icons/us.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        AppStrings.currentLanguage.value =
                            lang == AppLanguage.pt
                                ? AppLanguage.en
                                : AppLanguage.pt;
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
