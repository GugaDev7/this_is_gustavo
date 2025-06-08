import 'package:flutter/material.dart';
import '../colors.dart';

class ButtonStyles {
  static ButtonStyle primaryLight = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    elevation: 2,
  );

  static ButtonStyle primaryDark = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryDark,
    foregroundColor: AppColors.onPrimaryDark,
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    elevation: 2,
  );

  static ButtonStyle secondaryLight = OutlinedButton.styleFrom(
    foregroundColor: AppColors.secondary,
    side: const BorderSide(color: AppColors.secondary, width: 2),
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  );

  static ButtonStyle secondaryDark = OutlinedButton.styleFrom(
    foregroundColor: AppColors.secondaryDark,
    side: const BorderSide(color: AppColors.secondaryDark, width: 2),
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  );
}
