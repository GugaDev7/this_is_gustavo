import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';
import 'package:this_is_gustavo/view/widgets/responsive_row_column.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Widget _buildAboutText(double screenWidth) => Padding(
    padding: const EdgeInsets.only(left: 25.0, top: 4),
    child: Text(AppStrings.get('aboutMessage'), style: TextStyles.body),
  );

  Widget _buildTechList() {
    final technologies = [
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        technologies.length,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text('• ${technologies[i]}', style: TextStyles.caption),
        ),
      ),
    );
  }

  Widget _buildTechColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 40),
        child: Text(AppStrings.get('technologies'), style: TextStyles.body),
      ),
      const SizedBox(height: 16),
      Padding(padding: const EdgeInsets.only(left: 25.0), child: _buildTechList()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: AppStrings.currentLanguage,
      builder: (context, lang, _) {
        final screenWidth = MediaQuery.of(context).size.width;
        final canUseRow = screenWidth > 1100;

        return Scaffold(
          appBar: AppBarDecorations.buildAppBar(context, showDrawer: !canUseRow),
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
                      left: _buildAboutText(screenWidth),
                      right: _buildTechColumn(),
                      crossAxisAlignment: CrossAxisAlignment.start,
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
