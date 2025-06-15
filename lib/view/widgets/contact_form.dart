import 'package:flutter/material.dart';
import '../../core/viewmodels/contact_viewmodel.dart';
import '../../themes/decorations/input_decorations.dart';
import '../../l10n/strings.dart';

class ContactForm extends StatelessWidget {
  final ContactViewModel vm;
  const ContactForm({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        TextFormField(
          decoration: GetInputDecoration.getInputDecoration(
            label: "Nome Completo",
          ),
          onChanged: vm.setName,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: GetInputDecoration.getInputDecoration(label: "E-mail"),
          onChanged: vm.setEmail,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: GetInputDecoration.getInputDecoration(label: "Assunto"),
          onChanged: vm.setSubject,
        ),
        const SizedBox(height: 8),
        TextFormField(
          minLines: 5,
          maxLines: 5,
          decoration: GetInputDecoration.getInputDecoration(label: "Mensagem"),
          onChanged: vm.setMessage,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: vm.isLoading ? null : vm.send,
          child:
              vm.isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                    AppStrings.get('sendMessage'),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
        ),
      ],
    );
  }
}
