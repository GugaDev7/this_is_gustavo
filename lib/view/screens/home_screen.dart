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
    final boxDecoration = isDark ? AppBoxDecorations.cardDark : AppBoxDecorations.card;
    return Scaffold(
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: AppStrings.currentLanguage,
        builder: (context, lang, _) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                pinned: false,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: AppBarDecorations.buildAppBar(context, AppStrings.get('appTitle')),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 0,
                toolbarHeight: 0,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: boxDecoration,
                    child: Center(child: Text(AppStrings.get('welcomeMessage'))),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
