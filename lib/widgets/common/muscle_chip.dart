import 'package:flutter/material.dart';
import '../../utils/muscle_colors.dart';

class MuscleChip extends StatelessWidget {
  final String label;
  final bool selected;

  const MuscleChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final color = colorForMuscle(label);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
