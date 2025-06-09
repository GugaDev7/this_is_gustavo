import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/box_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/typing_text.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final List<String> technologies = [
    'Flutter (Mobile & Web)',
    'Dart',
    'Firebase',
    'Git & Github',
    'REST API',
    'SQLite',
    'MobX',
    'Provider',
    'Clean Code',
    'MVVM, MVC, Clean Architecture',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final boxDecoration =
        isDark ? AppBoxDecorations.cardDark : AppBoxDecorations.card;
    return Scaffold(
      appBar: AppBarDecorations.buildAppBar(
        context,
        AppStrings.get('appTitle'),
      ),
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: AppStrings.currentLanguage,
        builder: (context, lang, _) {
          final screenWidth = MediaQuery.of(context).size.width;
          final canUseRow = screenWidth > 1100;
          final isSmall = screenWidth < 800;

          // Defina fatores de proporção para as imagens
          final double mainImageHeight =
              canUseRow
                  ? screenWidth *
                      0.35 // 35% da largura da tela para Row
                  : screenWidth * 0.5; // 50% da largura da tela para Column

          final double portraitHeight =
              canUseRow
                  ? screenWidth *
                      0.33 // 33% da largura da tela para Row
                  : screenWidth * 0.45; // 45% da largura da tela para Column

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child:
                        canUseRow
                            ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25.0,
                                      top: 40,
                                    ),
                                    child: Text(
                                      AppStrings.get('aboutMessage'),
                                      style: TextStyles.body,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 25.0,
                                          top: 40,
                                        ),
                                        child: Text(
                                          AppStrings.get('technologies'),
                                          style: TextStyles.body,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 25.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              technologies
                                                  .map(
                                                    (tech) => Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 2.0,
                                                          ),
                                                      child: Text(
                                                        '• $tech',
                                                        style:
                                                            TextStyles.caption,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: screenWidth * 0.04),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: TypingText(
                                    text:
                                        AppStrings.get(
                                          'aboutMessage',
                                        ).trimRight(),
                                    style: TextStyles.presentation(
                                      screenWidth * 0.05,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ...technologies
                                    .map(
                                      (tech) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2.0,
                                        ),
                                        child: Text(
                                          '• $tech',
                                          style: TextStyles.caption,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
