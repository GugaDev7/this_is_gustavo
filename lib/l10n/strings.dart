import 'package:flutter/material.dart';

enum AppLanguage { pt, en }

class AppStrings {
  static final ValueNotifier<AppLanguage> currentLanguage =
      ValueNotifier<AppLanguage>(AppLanguage.pt);

  static const Map<AppLanguage, Map<String, String>> _localizedValues = {
    AppLanguage.pt: {
      'appTitle': 'Meu App',
      'homeTitle': 'Início',
      'welcomeMessage':
          'Olá, sou o Gustavo Rodrigues. Desenvolvedor Flutter em constante evolução. Estou sempre estudando, testando e buscando formas de me tornar um profissional \ncada vez melhor.',
      'aboutMe': 'Sobre mim',
      'projects': 'Projetos',
      'contact': 'Contato',
    },
    AppLanguage.en: {
      'appTitle': 'My App',
      'homeTitle': 'Home',
      'welcomeMessage':
          "Hi, I'm Gustavo Rodrigues. \nA Flutter Developer in constant evolution. I'm always learning, experimenting, and striving to become a better professional \nevery day.",
      'aboutMe': 'About Me',
      'projects': 'Projects',
      'contact': 'Contact',
    },
  };

  static String get(String key) {
    return _localizedValues[currentLanguage.value]?[key] ?? '';
  }
}
