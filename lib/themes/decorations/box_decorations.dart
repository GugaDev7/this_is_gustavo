import 'package:flutter/material.dart';
import 'package:this_is_gustavo/themes/colors.dart';

class AppBoxDecorations {
  static final BoxDecoration card = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [BoxShadow(color: AppColors.primaryDark, blurRadius: 8, offset: Offset(0, 2))],
  );

  static final BoxDecoration cardDark = BoxDecoration(
    color: AppColors.surfaceDark,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [BoxShadow(color: AppColors.primaryDark, blurRadius: 8, offset: Offset(0, 2))],
  );
}
