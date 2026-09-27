import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/achievement_store.dart';
import '../../theme/app_theme.dart';

/// Every achievement with its unlock state, shown in the Progress tab.
class AchievementsView extends StatefulWidget {
  const AchievementsView({super.key});

  @override
  State<AchievementsView> createState() => _AchievementsViewState();
}

class _AchievementsViewState extends State<AchievementsView> {
  @override
  void initState() {
    super.initState();
    AchievementStore.instance.addListener(_onChanged);
  }

  @override
  void dispose() {
    AchievementStore.instance.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final achievements = AchievementStore.instance.getAll(l10n);
    final unlocked = achievements.where((a) => a.isUnlocked).length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                unlocked == 0
                    ? l10n.home_noAchievements
                    : l10n.home_achievements,
                style: unlocked == 0
                    ? const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      )
                    : Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.accentYellow.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$unlocked/${achievements.length}',
                style: const TextStyle(
                  color: AppColors.accentYellow,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (final a in achievements)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: a.isUnlocked ? a.color.withAlpha(20) : AppColors.bgCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: a.isUnlocked
                    ? a.color.withAlpha(60)
                    : AppColors.bgCardLight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  a.isUnlocked ? a.icon : Icons.lock_outline_rounded,
                  color: a.isUnlocked
                      ? a.color
                      : AppColors.textMuted.withAlpha(120),
                  size: 28,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        a.title,
                        style: TextStyle(
                          color: a.isUnlocked
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        a.description,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (a.unlockedAt != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    '${a.unlockedAt!.day}/${a.unlockedAt!.month}/${a.unlockedAt!.year}',
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
