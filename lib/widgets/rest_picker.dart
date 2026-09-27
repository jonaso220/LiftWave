import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../theme/app_theme.dart';

/// Rest options offered per exercise: short for isolation work, long for
/// heavy compound lifts.
const List<int> restOptions = [30, 45, 60, 90, 120, 150, 180, 240];

/// "45 s" under a minute, "1:30" from there on.
String formatRest(int seconds) {
  if (seconds < 60) return '$seconds s';
  final minutes = seconds ~/ 60;
  final rest = seconds % 60;
  return '$minutes:${rest.toString().padLeft(2, '0')}';
}

/// Lets the user pick an exercise's rest. Returns null when dismissed;
/// otherwise a record whose `seconds` is null for "use the timer's default".
Future<({int? seconds})?> showRestPicker(
  BuildContext context, {
  required int? current,
}) {
  final l10n = S.of(context);
  return showModalBottomSheet<({int? seconds})>(
    context: context,
    backgroundColor: AppColors.bgCard,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.rest_forExercise,
              style: Theme.of(ctx).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final seconds in restOptions)
                  ChoiceChip(
                    label: Text(formatRest(seconds)),
                    selected: current == seconds,
                    selectedColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: current == seconds
                          ? Colors.white
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    showCheckmark: false,
                    onSelected: (_) => Navigator.pop(ctx, (seconds: seconds)),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                current == null
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: current == null
                    ? AppColors.primary
                    : AppColors.textMuted,
              ),
              title: Text(
                l10n.rest_default,
                style: TextStyle(color: AppColors.textPrimary),
              ),
              subtitle: Text(
                l10n.rest_defaultHint,
                style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
              onTap: () => Navigator.pop(ctx, (seconds: null)),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Compact "⏱ 1:30" label shown next to an exercise.
class RestBadge extends StatelessWidget {
  final int? seconds;
  final VoidCallback? onTap;

  const RestBadge({super.key, required this.seconds, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final label = seconds == null ? l10n.rest_default : formatRest(seconds!);
    return Semantics(
      button: onTap != null,
      label: '${l10n.rest_label}: $label',
      child: ExcludeSemantics(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 14,
                  color: seconds == null
                      ? AppColors.textMuted
                      : AppColors.primaryLight,
                ),
                const SizedBox(width: 3),
                Text(
                  label,
                  style: TextStyle(
                    color: seconds == null
                        ? AppColors.textMuted
                        : AppColors.primaryLight,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
