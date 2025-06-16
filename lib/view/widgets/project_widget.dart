import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatelessWidget {
  final String imageAsset;
  final String nameValue;
  final String descriptionValue;
  final String linkValue;
  final String linkValue2;

  const ProjectWidget({
    super.key,
    required this.imageAsset,
    required this.nameValue,
    required this.descriptionValue,
    required this.linkValue,
    required this.linkValue2,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageAsset),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                nameValue,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                descriptionValue,
                style: TextStyle(fontSize: isMobile ? 14 : 16),
              ),
            ),
            SizedBox(height: isMobile ? 8 : 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse(linkValue));
                      },
                      child: Text(AppStrings.get('viewProject')),
                      style:
                          isDarkMode
                              ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              )
                              : ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse(linkValue2));
                      },
                      child: Text(AppStrings.get('githubRepository')),
                      style:
                          isDarkMode
                              ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              )
                              : ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
