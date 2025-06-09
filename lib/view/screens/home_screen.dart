import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/box_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/typing_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                                // Texto responsivo usando welcomeMessage
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: TypingText(
                                      text: AppStrings.get('welcomeMessage'),
                                      style: TextStyles.presentation(
                                        screenWidth * 0.03,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/Portrait_Placeholder.png',
                                    height: portraitHeight.clamp(180, 580),
                                  ),
                                ),
                              ],
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Portrait_Placeholder.png',

                                  height: portraitHeight.clamp(100, 350),
                                ),
                                SizedBox(height: screenWidth * 0.04),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: TypingText(
                                    text:
                                        AppStrings.get(
                                          'welcomeMessage',
                                        ).trimRight(),
                                    style: TextStyles.presentation(
                                      screenWidth * 0.05,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
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
