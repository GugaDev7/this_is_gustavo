import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/view/widgets/project_widget.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: AppStrings.currentLanguage,
      builder: (context, lang, _) {
        final screenWidth = MediaQuery.of(context).size.width;
        final canUseRow = screenWidth > 1100;
        final crossAxisCount =
            canUseRow ? 3 : 1; // 3 colunas no desktop, 1 no mobile

        final projects = [
          {
            'image': 'assets/images/logo.png',
            'name': 'Projeto 1',
            'description': 'Descrição do Projeto 1',
            'link': 'https://github.com/projeto1',
          },
          {
            'image': 'assets/images/logo.png',
            'name': 'Projeto 2',
            'description': 'Descrição do Projeto 2',
            'link': 'https://github.com/projeto2',
          },
          {
            'image': 'assets/images/logo.png',
            'name': 'Projeto 3',
            'description': 'Descrição do Projeto 3',
            'link': 'https://github.com/projeto3',
          },
        ];

        return Scaffold(
          appBar: AppBarDecorations.buildAppBar(
            context,
            showDrawer: !canUseRow,
          ),
          drawer: !canUseRow ? const AppDrawer() : null,
          body: Stack(
            children: [
              const AnimatedWaveBackground(angle: 170),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Meus Principais Trabalhos",
                          style: TextStyles.title,
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: projects.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            final project = projects[index];
                            return ProjectWidget(
                              imageAsset: project['image']!,
                              nameValue: project['name']!,
                              descriptionValue: project['description']!,
                              linkValue: project['link']!,
                            );
                          },
                        ),
                      ],
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
