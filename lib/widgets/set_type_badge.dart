import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../models/set_type.dart';
import '../theme/app_theme.dart';

/// Full name of a set type, e.g. "Calentamiento".
String setTypeName(S l10n, SetType type) => switch (type) {
  SetType.normal => l10n.setType_normal,
  SetType.warmup => l10n.setType_warmup,
  SetType.drop => l10n.setType_drop,
  SetType.failure => l10n.setType_failure,
};

/// What the set's badge shows: its number for a normal set, a letter for
/// the others ("C" for calentamiento, "D" for drop set, "F" for al fallo).
String setTypeBadgeLabel(S l10n, SetType type, int number) => switch (type) {
  SetType.normal => '$number',
  SetType.warmup => l10n.setType_warmupShort,
  SetType.drop => l10n.setType_dropShort,
  SetType.failure => l10n.setType_failureShort,
};

/// Accent of a special set type; null for a normal set.
Color? setTypeColor(SetType type) => switch (type) {
  SetType.normal => null,
  SetType.warmup => AppColors.accentYellow,
  SetType.drop => AppColors.primaryLight,
  SetType.failure => AppColors.error,
};

/// The small square that identifies a set in a list: number or type letter.
class SetTypeBadge extends StatelessWidget {
  final SetType type;
  final int number;
  final bool done;
  final double size;

  const SetTypeBadge({
    super.key,
    required this.type,
    required this.number,
    this.done = false,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    final accent = setTypeColor(type);
    final foreground = accent != null
        ? AppColors.asText(accent)
        : done
        ? AppColors.accent
        : AppColors.textSecondary;
    final background = accent != null
        ? accent.withAlpha(40)
        : done
        ? AppColors.accent.withAlpha(51)
        : AppColors.bgCardLight;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Center(
        child: Text(
          setTypeBadgeLabel(S.of(context), type, number),
          style: TextStyle(
            color: foreground,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

/// The band across the top of an exercise card that belongs to a superset.
class SupersetStrip extends StatelessWidget {
  const SupersetStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.asText(AppColors.primaryLight);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      color: AppColors.primary.withAlpha(36),
      child: Row(
        children: [
          Icon(Icons.link_rounded, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            S.of(context).superset_label.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

/// The inline "superset" mark for compact lists (a routine's preview).
class SupersetTag extends StatelessWidget {
  const SupersetTag({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.asText(AppColors.primaryLight);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.link_rounded, size: 13, color: color),
        const SizedBox(width: 4),
        Text(
          S.of(context).superset_label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
