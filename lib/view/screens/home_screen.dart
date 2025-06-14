import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';
import 'package:this_is_gustavo/view/widgets/typing_text.dart';
import 'package:this_is_gustavo/view/widgets/responsive_row_column.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildWelcomeText(double screenWidth, bool isRow) => TypingText(
    text: AppStrings.get('welcomeMessage'),
    style: TextStyles.presentation(screenWidth * 0.03),
    textAlign: isRow ? TextAlign.right : TextAlign.center,
  );

  Widget _buildPortrait(double portraitHeight) => Image.asset(
    'assets/images/Portrait_Placeholder.png',
    height: portraitHeight.clamp(180, 580),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: AppStrings.currentLanguage,
      builder: (context, lang, _) {
        final screenWidth = MediaQuery.of(context).size.width;
        final canUseRow = screenWidth > 1100;
        final double portraitHeight =
            canUseRow ? screenWidth * 0.33 : screenWidth * 0.60;
        final double textWidth =
            canUseRow ? screenWidth * 0.9 : screenWidth * 1.5;

        return Scaffold(
          appBar: AppBarDecorations.buildAppBar(
            context,
            showDrawer: !canUseRow,
          ),
          drawer: !canUseRow ? const AppDrawer() : null,
          body: Stack(
            children: [
              const AnimatedWaveBackground(angle: 170),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: ResponsiveRowColumn(
                      useRow: canUseRow,
                      left: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: _buildWelcomeText(textWidth, canUseRow),
                      ),
                      right: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: _buildPortrait(portraitHeight),
                      ),
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
