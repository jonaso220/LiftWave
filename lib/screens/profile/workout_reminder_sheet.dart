import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/custom_template_store.dart';
import '../../services/workout_reminder_service.dart';
import '../../services/workout_reminder_sync.dart';
import '../../theme/app_theme.dart';

/// Short name of a weekday (`DateTime.monday`..`DateTime.sunday`) in the
/// app's language: "lun", "Mon", "月"…
String shortWeekdayName(BuildContext context, int weekday) {
  final locale = Localizations.localeOf(context).toString();
  // 1 January 2024 was a Monday.
  return DateFormat.E(locale).format(DateTime(2024, 1, weekday));
}

String _formatMinutes(BuildContext context, int minutesOfDay) => TimeOfDay(
  hour: minutesOfDay ~/ 60,
  minute: minutesOfDay % 60,
).format(context);

/// One line describing the reminders: "lun, mié, vie · 18:00", or that
/// they are off.
String workoutReminderSummary(BuildContext context) {
  final reminders = WorkoutReminderService.instance;
  if (!reminders.enabled) return S.of(context).reminders_off;
  final days = reminders.weekdays.toList()..sort();
  final names = days.map((day) => shortWeekdayName(context, day)).join(', ');
  return '$names · ${_formatMinutes(context, reminders.minutesOfDay)}';
}

Future<void> showWorkoutReminderSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const WorkoutReminderSheet(),
  );
}

class WorkoutReminderSheet extends StatefulWidget {
  const WorkoutReminderSheet({super.key});

  @override
  State<WorkoutReminderSheet> createState() => _WorkoutReminderSheetState();
}

class _WorkoutReminderSheetState extends State<WorkoutReminderSheet> {
  WorkoutReminderService get _reminders => WorkoutReminderService.instance;

  bool _busy = false;
  bool _denied = false;

  @override
  void initState() {
    super.initState();
    _reminders.addListener(_onChanged);
  }

  @override
  void dispose() {
    _reminders.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _setEnabled(bool value) async {
    final l10n = S.of(context);
    if (!value) {
      await _reminders.disable();
      return;
    }
    if (_busy) return;
    setState(() {
      _busy = true;
      _denied = false;
    });
    final enabled = await _reminders.enable(
      // Start from the days the user already trains on.
      suggestedWeekdays: routinesByWeekday(
        CustomTemplateStore.instance.templates,
      ).keys.toSet(),
    );
    if (enabled) await syncWorkoutReminders(l10n);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _denied = !enabled;
    });
  }

  Future<void> _toggleDay(int weekday) async {
    final l10n = S.of(context);
    HapticFeedback.selectionClick();
    await _reminders.toggleWeekday(weekday);
    await syncWorkoutReminders(l10n);
  }

  Future<void> _pickTime() async {
    final l10n = S.of(context);
    final current = _reminders.minutesOfDay;
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: current ~/ 60, minute: current % 60),
    );
    if (picked == null) return;
    await _reminders.setMinutesOfDay(picked.hour * 60 + picked.minute);
    await syncWorkoutReminders(l10n);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final enabled = _reminders.enabled;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    color: AppColors.primaryLight,
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.reminders_title,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10n.reminders_enable,
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                subtitle: Text(
                  l10n.reminders_enableSubtitle,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                value: enabled,
                activeThumbColor: AppColors.primary,
                onChanged: _busy ? null : _setEnabled,
              ),
              if (_denied)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    l10n.reminders_permissionDenied,
                    style: TextStyle(
                      color: AppColors.asText(AppColors.accentYellow),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (enabled) ...[
                const SizedBox(height: 8),
                Text(
                  l10n.reminders_days,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (
                      var day = DateTime.monday;
                      day <= DateTime.sunday;
                      day++
                    )
                      FilterChip(
                        label: Text(shortWeekdayName(context, day)),
                        selected: _reminders.weekdays.contains(day),
                        onSelected: (_) => _toggleDay(day),
                        showCheckmark: false,
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.bgCardLight,
                        labelStyle: TextStyle(
                          color: _reminders.weekdays.contains(day)
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.schedule_rounded,
                    color: AppColors.primaryLight,
                  ),
                  title: Text(
                    l10n.reminders_time,
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  trailing: Text(
                    _formatMinutes(context, _reminders.minutesOfDay),
                    style: TextStyle(
                      color: AppColors.asText(AppColors.primaryLight),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: _pickTime,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
