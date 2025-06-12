import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/decorations/input_decorations.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/drawer_decoration.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';
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
      appBar: AppBarDecorations.buildAppBar(context, showDrawer: !canUseRow),
      body: Stack(
        children: [
          const AnimatedWaveBackground(angle: 170),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150, top: 40, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.get('welcomecontact'), style: TextStyles.subtitle),
                SizedBox(height: 25),
                Column(
                  children: [
                    TextFormField(decoration: GetInputDecoration.getInputDecoration(label: "Nome Completo")),
                    SizedBox(height: 8),
                    TextFormField(decoration: GetInputDecoration.getInputDecoration(label: "E-mail")),
                    SizedBox(height: 8),
                    TextFormField(decoration: GetInputDecoration.getInputDecoration(label: "Assunto")),
                    SizedBox(height: 8),
                    TextFormField(
                      minLines: 5,
                      maxLines: 5,
                      decoration: GetInputDecoration.getInputDecoration(label: "Mensagem"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {}, child: Text(AppStrings.get('sendMessage'))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: !canUseRow ? const AppDrawer() : null,
    );
  }
}
