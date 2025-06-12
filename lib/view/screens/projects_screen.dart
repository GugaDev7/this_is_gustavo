import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final canUseRow = screenWidth > 1100;

    return Scaffold(
      appBar: AppBarDecorations.buildAppBar(context, AppStrings.get('appTitle'), showDrawer: !canUseRow),
      body: Stack(children: [const AnimatedWaveBackground(angle: 170)]),
      drawer: !canUseRow ? const AppDrawer() : null,
    );
  }
}
