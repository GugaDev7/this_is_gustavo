import 'package:flutter/material.dart';

enum AppLanguage { pt, en }

class AppStrings {
  static final ValueNotifier<AppLanguage> currentLanguage =
      ValueNotifier<AppLanguage>(AppLanguage.pt);

  static void changeLanguage(AppLanguage newLanguage) {
    if (currentLanguage.value != newLanguage) {
      currentLanguage.value = newLanguage;
    }
  }

  static const Map<AppLanguage, Map<String, String>> _localizedValues = {
    AppLanguage.pt: {
      // Configurações Gerais
      'themeMode': 'Tema',
      'appTitle': 'Meu Portfólio',

      // Home Screen
      'homeTitle': 'Início',
      'welcomeMessage':
          'Olá, sou o Gustavo Rodrigues. Desenvolvedor Flutter em constante evolução. Estou sempre estudando, testando e buscando formas de me tornar um profissional \ncada vez melhor.',

      // About Screen
      'aboutMe': 'Sobre mim',
      'aboutMessage':
          """Sou Desenvolvedor Flutter com foco na criação de aplicações móveis modernas, funcionais e com excelente experiência de usuário. Tenho sólida experiência no desenvolvimento com Dart e domínio das principais ferramentas do ecossistema Flutter, como Firebase (Auth, Firestore, Storage), integração com APIs REST, gerenciamento de estado utilizando MobX e Provider, além da aplicação de boas práticas com Clean Code e arquitetura limpa (MVVM/MVC).

Além da minha atuação como desenvolvedor, também possuo experiência como administrador de sistemas no ERP Protheus e suporte técnico N2 em infraestrutura de TI, o que me proporciona uma visão abrangente sobre integração de sistemas, desempenho e segurança em ambientes corporativos.

Atualmente, estou aprofundando meus conhecimentos em testes automatizados e animações avançadas, com o objetivo de elevar ainda mais a qualidade, confiabilidade e interatividade das aplicações que desenvolvo.

Sou movido por desafios e estou sempre em busca de aprimorar minhas habilidades técnicas, produtividade e qualidade dos projetos. Meu compromisso é entregar soluções eficientes, escaláveis e centradas no usuário.""",
      'technologies': 'Tecnologias e ferramentas que trabalho:',

      // Projects Screen
      'projects': 'Projetos',
      'myProjects': 'Meus Principais Trabalhos',
      'thisIsGustavoDescription':
          'Este é um projeto feito com Flutter para servir como meu portfólio, onde eu posso mostrar meus projetos e minhas habilidades.',
      'easyTasksDescription':
          'EasyTasks é um aplicativo feito com Flutter para gerenciar suas tarefas de forma fácil e eficiente.',
      'viewProject': 'Ver projeto',
      'githubRepository': 'Repositório Github',

      // Contact Screen
      'contact': 'Contato',
      'contacts': 'Contatos',
      'welcomecontact':
          'Entre em contato\nFico à disposição para conversar sobre oportunidades, projetos ou colaborações. \nPreencha o formulário ou use os links abaixo para me contatar.',
      'sendMessage': 'Enviar',
      'name': 'Nome Completo',
      'email': 'E-mail',
      'subject': 'Assunto',
      'message': 'Mensagem',
      'fieldRequired': 'Este campo é obrigatório',
      'emailRequired': 'O e-mail é obrigatório',
      'invalidEmail': 'Por favor, insira um e-mail válido',
    },

    AppLanguage.en: {
      // General Settings
      'themeMode': 'Theme',
      'appTitle': 'My Portfolio',

      // Home Screen
      'homeTitle': 'Home',
      'welcomeMessage':
          "Hi, I'm Gustavo Rodrigues. \nA Flutter Developer in constant evolution. I'm always learning, experimenting, and striving to become a better professional \nevery day.",

      // About Screen
      'aboutMe': 'About Me',
      'aboutMessage':
          """I'm a Flutter Developer focused on building modern, functional mobile applications with an excellent user experience. I have solid experience in Dart development and expertise in key Flutter ecosystem tools including Firebase (Auth, Firestore, Storage), REST API integration, and state management using MobX and Provider. I consistently apply best practices with Clean Code and Clean Architecture (MVVM/MVC).

Beyond my development role, I bring valuable experience as a Protheus ERP system administrator and Level 2 IT infrastructure support specialist. This background gives me a comprehensive understanding of system integration, performance optimization, and security in enterprise environments.

Currently, I'm enhancing my expertise in automated testing and advanced animations to further elevate the quality, reliability, and user engagement of my applications.

Driven by challenges, I continuously seek to enhance my technical skills, productivity, and project quality. My commitment is to deliver efficient, scalable, and user-centric solutions that make a real impact.""",
      'technologies': 'Technologies & tools I work with:',

      // Projects Screen
      'projects': 'Projects',
      'myProjects': 'My Main Works',
      'thisIsGustavoDescription':
          'This is a project I made using Flutter to serve as my portfolio, where I can show my projects and my skills.',
      'easyTasksDescription':
          'EasyTasks is an app made with Flutter to manage your tasks easily and efficiently.',
      'viewProject': 'View Project',
      'githubRepository': 'Github Repository',

      // Contact Screen
      'contact': 'Contact',
      'contacts': 'Contacts',
      'welcomecontact':
          '''Get in touch\nI'm available to discuss opportunities, projects, or collaborations. \nFill out the form or use the links below to reach out.''',
      'sendMessage': 'Send',
      'name': 'Full Name',
      'email': 'Email',
      'subject': 'Subject',
      'message': 'Message',
      'fieldRequired': 'This field is required',
      'emailRequired': 'Email is required',
      'invalidEmail': 'Please enter a valid email',
    },
  };

  static String get(String key) {
    return _localizedValues[currentLanguage.value]?[key] ?? '';
  }
}
