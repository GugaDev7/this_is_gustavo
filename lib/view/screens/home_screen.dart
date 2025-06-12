import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';
import 'package:this_is_gustavo/view/widgets/typing_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final canUseRow = screenWidth > 1100;
    final double portraitHeight = canUseRow ? screenWidth * 0.33 : screenWidth * 0.45;

    return Scaffold(
      appBar: AppBarDecorations.buildAppBar(context, showDrawer: !canUseRow),
      drawer: !canUseRow ? const AppDrawer() : null,
      body: Stack(
        children: [
          const AnimatedWaveBackground(angle: 170),
          ValueListenableBuilder<AppLanguage>(
            valueListenable: AppStrings.currentLanguage,
            builder: (context, lang, _) {
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
                                        padding: const EdgeInsets.only(left: 25.0),
                                        child: TypingText(
                                          text: AppStrings.get('welcomeMessage'),
                                          style: TextStyles.presentation(screenWidth * 0.03),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: TypingText(
                                        text: AppStrings.get('welcomeMessage').trimRight(),
                                        style: TextStyles.presentation(screenWidth * 0.05),
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
        ],
      ),
    );
  }
}
