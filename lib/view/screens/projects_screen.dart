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
            canUseRow ? 2 : 1; // 3 colunas no desktop, 1 no mobile
        final childAspectRatio = canUseRow ? 1.15 : 1.1;
        final isMobile = screenWidth < 600;
        final projects = [
          {
            'image': 'assets/images/projects/thisisgustavo.png',
            'name': 'This is Gustavo',
            'description': '${AppStrings.get('thisIsGustavoDescription')}',
            'link': 'https://this-is-gustavo.vercel.app/',
            'link2': 'https://github.com/GugaDev7/this_is_gustavo',
          },
          {
            'image': 'assets/images/projects/easytasks.png',
            'name': 'EasyTasks',
            'description': '${AppStrings.get('easyTasksDescription')}',
            'link': 'https://easy-tasks-gsr.vercel.app/',
            'link2': 'https://github.com/GugaDev7/flutter-easytasks',
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
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.get('myProjects'),
                          style: TextStyles.presentation(isMobile ? 30 : 40),
                        ),
                        const SizedBox(height: 8),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: projects.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: childAspectRatio.toDouble(),
                              ),
                          itemBuilder: (context, index) {
                            final project = projects[index];
                            return ProjectWidget(
                              imageAsset: project['image']!,
                              nameValue: project['name']!,
                              descriptionValue: project['description']!,
                              linkValue: project['link']!,
                              linkValue2: project['link2']!,
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
