import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/view/widgets/animated_wave_background.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
