import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/contact_model.dart';
import '../config/emailjs_config.dart';

class ContactViewModel extends ChangeNotifier {
  final model = ContactModel();
  bool isLoading = false;

  void setName(String value) {
    model.name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    model.email = value;
    notifyListeners();
  }

  void setSubject(String value) {
    model.subject = value;
    notifyListeners();
  }

  void setMessage(String value) {
    model.message = value;
    notifyListeners();
  }

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

  void _showSnackBar(ScaffoldMessengerState scaffoldMessenger, String message) {
    final isSuccess = message.contains('sucesso');
    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isSuccess ? Colors.green : Colors.red),
    );
  }

  void _clearFields() {
    model.name = '';
    model.email = '';
    model.subject = '';
    model.message = '';
    notifyListeners();
  }
}
