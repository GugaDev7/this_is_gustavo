import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final canUseRow = screenWidth > 1100;

    Widget techList() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        technologies.length,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text('• ${technologies[i]}', style: TextStyles.caption),
        ),
      ),
    );

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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child:
                        canUseRow
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25.0, top: 58),
                                    child: Text(AppStrings.get('aboutMessage'), style: TextStyles.body),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25.0, top: 40),
                                        child: Text(AppStrings.get('technologies'), style: TextStyles.body),
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(padding: const EdgeInsets.only(left: 25.0), child: techList()),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    AppStrings.get('aboutMessage').trimRight(),
                                    style: TextStyles.presentation(screenWidth * 0.05),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(AppStrings.get('technologies'), style: TextStyles.body),
                                techList(),
                              ],
                            ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
