import 'package:flutter/material.dart';
import 'package:this_is_gustavo/l10n/strings.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/appbar_decorations.dart';
import 'package:this_is_gustavo/themes/decorations/box_decorations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final boxDecoration =
        isDark ? AppBoxDecorations.cardDark : AppBoxDecorations.card;
    return Scaffold(
      appBar: AppBarDecorations.buildAppBar(
        context,
        AppStrings.get('appTitle'),
      ), // <-- AppBar fixa aqui
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: AppStrings.currentLanguage,
        builder: (context, lang, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(AppStrings.get('welcomeMessage')),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
