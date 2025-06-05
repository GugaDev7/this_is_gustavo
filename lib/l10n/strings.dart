import 'package:flutter/material.dart';

enum AppLanguage { pt, en }

class AppStrings {
  static final ValueNotifier<AppLanguage> currentLanguage = ValueNotifier<AppLanguage>(AppLanguage.pt);

  static const Map<AppLanguage, Map<String, String>> _localizedValues = {
    AppLanguage.pt: {
      'appTitle': 'Meu App',
      'welcomeMessage': 'Bem-vindo ao meu aplicativo!',
      'settings': 'Configurações',
      'profile': 'Perfil',
      'logout': 'Sair',
    },
    AppLanguage.en: {
      'appTitle': 'My App',
      'welcomeMessage': 'Welcome to my app!',
      'settings': 'Settings',
      'profile': 'Profile',
      'logout': 'Logout',
    },
  };

  static String get(String key) {
    return _localizedValues[currentLanguage.value]?[key] ?? '';
  }
}
