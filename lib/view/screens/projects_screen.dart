import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';
import 'package:this_is_gustavo/l10n/strings.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
              // Adicione aqui o conteúdo do seu ProjectsScreen, usando ResponsiveRowColumn se necessário
            ],
          ),
        );
      },
    );
  }
}
