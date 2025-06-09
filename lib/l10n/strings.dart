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
      'aboutMessage':
          """Sou Gustavo Rodrigues, desenvolvedor Flutter apaixonado por tecnologia e pelo processo de transformar ideias em soluções digitais funcionais e bonitas. Estou constantemente estudando, me desafiando e evoluindo como desenvolvedor, buscando sempre boas práticas, código limpo e interfaces intuitivas.

Atualmente, foco no desenvolvimento de aplicativos mobile e web com Flutter, aprimorando meus conhecimentos em arquitetura, testes, performance e design responsivo.""",
      'technologies': 'Tecnologias e ferramentas que domino',
      'projects': 'Projetos',
      'contact': 'Contato',
    },

    AppLanguage.en: {
      'appTitle': 'My App',
      'homeTitle': 'Home',
      'welcomeMessage':
          "Hi, I'm Gustavo Rodrigues. \nA Flutter Developer in constant evolution. I'm always learning, experimenting, and striving to become a better professional \nevery day.",
      'aboutMe': 'About Me',
      'aboutMessage':
          """I'm Gustavo Rodrigues, a Flutter developer passionate about technology and turning ideas into functional and beautiful digital solutions. I'm constantly learning, challenging myself, and evolving as a developer — always aiming for clean code, good practices, and intuitive UI.

Currently, I focus on building mobile and web applications with Flutter, while improving my skills in architecture, testing, performance, and responsive design.""",
      'technologies': 'Technologies & tools I work with',
      'projects': 'Projects',
      'contact': 'Contact',
    },
  };

  static String get(String key) {
    return _localizedValues[currentLanguage.value]?[key] ?? '';
  }
}
