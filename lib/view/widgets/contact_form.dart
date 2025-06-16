import 'package:flutter/material.dart';
import '../../core/viewmodels/contact_viewmodel.dart';
import '../../themes/decorations/input_decorations.dart';
import '../../l10n/strings.dart';

class ContactForm extends StatefulWidget {
  final ContactViewModel vm;
  const ContactForm({super.key, required this.vm});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
            decoration: GetInputDecoration.getInputDecoration(
              label: AppStrings.get('name'),
              icon: Icons.person,
            ),
            validator: _validateRequired,
            onChanged: widget.vm.setName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            decoration: GetInputDecoration.getInputDecoration(
              label: AppStrings.get('email'),
              icon: Icons.email,
            ),
            validator: _validateEmail,
            onChanged: widget.vm.setEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _subjectController,
            decoration: GetInputDecoration.getInputDecoration(
              label: AppStrings.get('subject'),
              icon: Icons.subject,
            ),
            validator: _validateRequired,
            onChanged: widget.vm.setSubject,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _messageController,
            minLines: 5,
            maxLines: 5,
            decoration: GetInputDecoration.getInputDecoration(
              label: AppStrings.get('message'),
              icon: Icons.message,
            ),
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
                        widget.vm.send();
                      }
                    },
            child:
                widget.vm.isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                      AppStrings.get('sendMessage'),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
