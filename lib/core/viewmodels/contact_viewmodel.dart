import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/contact_model.dart';
import '../config/emailjs_config.dart';

/// ViewModel responsável por gerenciar o estado e a lógica do formulário de contato.
/// Implementa o padrão MVVM (Model-View-ViewModel) para separar a lógica de negócios da interface.
class ContactViewModel extends ChangeNotifier {
  /// Modelo de dados que armazena as informações do formulário
  final model = ContactModel();

  /// Flag que indica se o formulário está em processo de envio
  bool isLoading = false;

  /// Atualiza o nome no modelo e notifica os listeners
  void setName(String value) {
    model.name = value;
    notifyListeners();
  }

  /// Atualiza o email no modelo e notifica os listeners
  void setEmail(String value) {
    model.email = value;
    notifyListeners();
  }

  /// Atualiza o assunto no modelo e notifica os listeners
  void setSubject(String value) {
    model.subject = value;
    notifyListeners();
  }

  /// Atualiza a mensagem no modelo e notifica os listeners
  void setMessage(String value) {
    model.message = value;
    notifyListeners();
  }

  /// Envia os dados do formulário para o servidor
  ///
  /// [context] é usado para mostrar feedback visual ao usuário
  Future<void> send(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final body = {
      'service_id': EmailJsConfig.serviceId,
      'template_id': EmailJsConfig.templateId,
      'user_id': EmailJsConfig.publicKey,
      'template_params': {
        'name': model.name,
        'email': model.email,
        'title': model.subject,
        'message': model.message,
        'time': DateTime.now().toString(),
      },
    };

    try {
      final response = await http.post(
        url,
        headers: {'origin': 'http://localhost', 'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        _showSnackBar(scaffoldMessenger, 'Mensagem enviada com sucesso!');
        _clearFields();
      } else {
        _showSnackBar(scaffoldMessenger, 'Erro ao enviar: ${response.body}');
      }
    } catch (e) {
      _showSnackBar(scaffoldMessenger, 'Erro: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  /// Mostra uma SnackBar com feedback visual para o usuário
  ///
  /// [scaffoldMessenger] é usado para mostrar a SnackBar
  /// [message] é a mensagem a ser exibida
  void _showSnackBar(ScaffoldMessengerState scaffoldMessenger, String message) {
    final isSuccess = message.contains('sucesso');
    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isSuccess ? Colors.green : Colors.red),
    );
  }

  /// Limpa todos os campos do formulário
  void _clearFields() {
    model.name = '';
    model.email = '';
    model.subject = '';
    model.message = '';
    notifyListeners();
  }
}
