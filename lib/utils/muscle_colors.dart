import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Brand color for a muscle group. Keys are the Spanish group names used
/// throughout the exercise data. Unknown groups (e.g. custom exercises with a
/// free-form group) fall back to the primary color.
Color colorForMuscle(String muscle) {
  switch (muscle) {
    case 'Pecho':
      return AppColors.chest;
    case 'Espalda':
      return AppColors.back;
    case 'Piernas':
      return AppColors.legs;
    case 'Hombros':
      return AppColors.shoulders;
    case 'Brazos':
      return AppColors.arms;
    case 'Core':
      return AppColors.core;
    case 'CrossFit':
      return AppColors.crossfit;
    default:
      return AppColors.primary;
  }
}
