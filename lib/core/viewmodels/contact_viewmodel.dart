import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
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

  Future<void> send() async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    // Simule envio
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
    // Aqui você pode mostrar um snackbar ou navegar
  }
}