import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../themes/decorations/text_styles.dart';
import '../../l10n/strings.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: AppStrings.currentLanguage,
      builder: (context, lang, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(AppStrings.get('contacts'), style: TextStyles.subtitle),
            const SizedBox(height: 10),
            _buildContactItem(Icons.email, 'gustavo.rodriguesrj@outlook.com'),
            const SizedBox(height: 8),
            _buildContactItem(Icons.phone, '+55 (83) 99160-3958'),
            const SizedBox(height: 8),
            _buildContactItem(Icons.location_on, 'Mamanguape, PB - Brasil'),
            const SizedBox(height: 8),
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              cursor: isHovering ? SystemMouseCursors.click : SystemMouseCursors.basic,
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/gustavo-rodrigues-167264361/')),
                child: _buildContactItem(Icons.link, "Linkedin"),
              ),
            ),
            const SizedBox(height: 8),
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              cursor: isHovering ? SystemMouseCursors.click : SystemMouseCursors.basic,
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse('https://github.com/GugaDev7')),
                child: _buildContactItem(Icons.code, "Github"),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white),
        const SizedBox(width: 8),
        Text(text, style: TextStyles.body),
      ],
    );
  }
}
