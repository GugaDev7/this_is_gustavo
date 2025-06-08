import 'package:flutter/material.dart';

enum AppLanguage { pt, en }

class AppStrings {
  static final ValueNotifier<AppLanguage> currentLanguage =
      ValueNotifier<AppLanguage>(AppLanguage.pt);

  static const Map<AppLanguage, Map<String, String>> _localizedValues = {
    AppLanguage.pt: {
      'appTitle': 'Meu App',
      'homeTitle': 'Início',
      'welcomeMessage': 'Bem-vindo ao meu aplicativo!',
      'aboutMe': 'Sobre mim',
      'projects': 'Projetos',
      'contact': 'Contato',
    },
    AppLanguage.en: {
      'appTitle': 'My App',
      'homeTitle': 'Home',
      'welcomeMessage': 'Welcome to my app!',
      'aboutMe': 'About Me',
      'projects': 'Projects',
      'contact': 'Contact',
    },
  };

  static String get(String key) {
    return _localizedValues[currentLanguage.value]?[key] ?? '';
  }
}
