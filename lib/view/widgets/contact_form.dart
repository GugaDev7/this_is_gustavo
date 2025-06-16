import 'package:flutter/material.dart';
import '../../core/viewmodels/contact_viewmodel.dart';
import '../../themes/decorations/input_decorations.dart';
import '../../l10n/strings.dart';

/// Widget que representa o formulário de contato.
/// Responsável por coletar e validar os dados do usuário.
class ContactForm extends StatefulWidget {
  /// ViewModel que gerencia o estado e a lógica do formulário
  final ContactViewModel vm;

  const ContactForm({super.key, required this.vm});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  /// Chave global para validação do formulário
  final _formKey = GlobalKey<FormState>();

  /// Controladores para os campos de texto
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onViewModelChanged);
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  /// Callback chamado quando o ViewModel é atualizado
  void _onViewModelChanged() {
    if (!widget.vm.isLoading && widget.vm.model.name.isEmpty) {
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  /// Valida se o email está em um formato válido
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.get('emailRequired');
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.get('invalidEmail');
    }
    return null;
  }

  /// Valida se o campo é obrigatório
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.get('fieldRequired');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: GetInputDecoration.getInputDecoration(label: AppStrings.get('name'), icon: Icons.person),
            validator: _validateRequired,
            onChanged: widget.vm.setName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            decoration: GetInputDecoration.getInputDecoration(label: AppStrings.get('email'), icon: Icons.email),
            validator: _validateEmail,
            onChanged: widget.vm.setEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _subjectController,
            decoration: GetInputDecoration.getInputDecoration(label: AppStrings.get('subject'), icon: Icons.subject),
            validator: _validateRequired,
            onChanged: widget.vm.setSubject,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _messageController,
            minLines: 5,
            maxLines: 5,
            decoration: GetInputDecoration.getInputDecoration(label: AppStrings.get('message'), icon: Icons.message),
            validator: _validateRequired,
            onChanged: widget.vm.setMessage,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed:
                widget.vm.isLoading
                    ? null
                    : () {
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.vm.send(context);
                      }
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? Colors.white : Colors.white,
              disabledBackgroundColor: isDarkMode ? Colors.white : Colors.white,
            ),
            child:
                widget.vm.isLoading
                    ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(isDarkMode ? Colors.black : Colors.black),
                      ),
                    )
                    : Text(
                      AppStrings.get('sendMessage'),
                      style: TextStyle(color: isDarkMode ? Colors.black : Colors.black),
                    ),
          ),
        ],
      ),
    );
  }
}
