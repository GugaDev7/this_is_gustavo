import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/colors.dart';
import 'package:this_is_gustavo/themes/decorations/text_styles.dart';

class GetInputDecoration {
  static InputDecoration getInputDecoration({
    required String label,
    String? hint,
    IconData? icon,
    Widget? suffixIcon,
    bool isDense = false,
    bool filled = false,
    Color? fillColor,
  }) {
    return InputDecoration(
      icon: icon != null ? Icon(icon) : null,
      hintText: label,
      hintStyle: TextStyles.textFieldDark,
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.warning, width: 4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.error, width: 4),
      ),
    );
  }
}
