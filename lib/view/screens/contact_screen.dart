import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/contact_viewmodel.dart';
import '../../l10n/strings.dart';
import '../../themes/decorations/appbar_decorations.dart';
import '../../themes/decorations/drawer_decoration.dart';
import '../../themes/decorations/text_styles.dart';
import '../widgets/animated_wave_background.dart';
import '../widgets/responsive_row_column.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_info.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Widget _buildWelcomeText(double width) =>
      Text(AppStrings.get('welcomecontact'), style: TextStyles.subtitle, textAlign: TextAlign.left);

  Widget _buildLeftContent(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildWelcomeText(width), const ContactInfo()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactViewModel(),
      child: Consumer<ContactViewModel>(
        builder: (context, vm, _) {
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
                    Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 100, top: 20, bottom: 20),
                          child: Form(
                            child: ResponsiveRowColumn(
                              useRow: canUseRow,
                              left: canUseRow ? _buildLeftContent(screenWidth) : ContactForm(vm: vm),
                              right: canUseRow ? ContactForm(vm: vm) : _buildLeftContent(screenWidth),
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
