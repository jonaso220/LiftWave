import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/training_preferences_store.dart';
import '../../models/training_preferences.dart';
import '../../theme/app_theme.dart';

class TrainingPreferencesScreen extends StatefulWidget {
  final bool isEditing;
  final TrainingPreferences? initialPreferences;
  final Future<void> Function(TrainingPreferences preferences)? onSave;
  final Future<void> Function()? onSkip;

  const TrainingPreferencesScreen({
    super.key,
    this.isEditing = false,
    this.initialPreferences,
    this.onSave,
    this.onSkip,
  });

  @override
  State<TrainingPreferencesScreen> createState() =>
      _TrainingPreferencesScreenState();
}

class _TrainingPreferencesScreenState extends State<TrainingPreferencesScreen> {
  static const _stepCount = 4;

  final PageController _pageController = PageController();
  int _currentStep = 0;
  TrainingGoal? _goal;
  ExperienceLevel? _experience;
  int _daysPerWeek = 3;
  final Set<TrainingEquipment> _equipment = {};
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final current =
        widget.initialPreferences ??
        TrainingPreferencesStore.instance.preferences;
    if (current != null) {
      _goal = current.goal;
      _experience = current.experience;
      _daysPerWeek = current.daysPerWeek;
      _equipment.addAll(current.equipment);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _canContinue => switch (_currentStep) {
    0 => _goal != null,
    1 => _experience != null,
    2 => true,
    3 => _equipment.isNotEmpty,
    _ => false,
  };

  Future<void> _continue() async {
    if (!_canContinue || _saving) return;
    if (_currentStep < _stepCount - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
      );
      return;
    }

    setState(() => _saving = true);
    final preferences = TrainingPreferences(
      goal: _goal!,
      experience: _experience!,
      daysPerWeek: _daysPerWeek,
      equipment: Set.unmodifiable(_equipment),
    );
    final onSave = widget.onSave;
    if (onSave != null) {
      await onSave(preferences);
    } else {
      await TrainingPreferencesStore.instance.save(preferences);
    }
    if (!mounted) return;
    if (widget.isEditing) Navigator.pop(context, true);
  }

  Future<void> _skip() async {
    if (_saving) return;
    setState(() => _saving = true);
    final onSkip = widget.onSkip;
    if (onSkip != null) {
      await onSkip();
    } else {
      await TrainingPreferencesStore.instance.dismissOnboarding();
    }
  }

  void _back() {
    if (_currentStep == 0) {
      if (widget.isEditing) Navigator.pop(context);
      return;
    }
    _pageController.previousPage(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
    );
  }

  void _toggleEquipment(TrainingEquipment value) {
    setState(() {
      if (value == TrainingEquipment.noEquipment) {
        _equipment
          ..clear()
          ..add(value);
        return;
      }
      _equipment.remove(TrainingEquipment.noEquipment);
      if (!_equipment.add(value)) _equipment.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 12, 12),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(32),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(
                      Icons.waves_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.isEditing
                          ? l10n.profile_trainingPreferences
                          : l10n.onboarding_title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (widget.isEditing)
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.textSecondary,
                      ),
                    )
                  else
                    TextButton(
                      onPressed: _saving ? null : _skip,
                      child: Text(
                        l10n.onboarding_skip,
                        style: const TextStyle(color: AppColors.textMuted),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(
                  _stepCount,
                  (index) => Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      height: 4,
                      margin: EdgeInsets.only(
                        right: index == _stepCount - 1 ? 0 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: index <= _currentStep
                            ? AppColors.primary
                            : AppColors.bgCardLight,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) => setState(() => _currentStep = value),
                children: [
                  _buildGoalStep(l10n),
                  _buildExperienceStep(l10n),
                  _buildDaysStep(l10n),
                  _buildEquipmentStep(l10n),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              decoration: const BoxDecoration(
                color: AppColors.bgCard,
                border: Border(top: BorderSide(color: AppColors.bgCardLight)),
              ),
              child: Row(
                children: [
                  if (_currentStep > 0 || widget.isEditing) ...[
                    OutlinedButton(
                      onPressed: _saving ? null : _back,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        side: const BorderSide(color: AppColors.bgCardLight),
                        minimumSize: const Size(92, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(l10n.onboarding_back),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _canContinue && !_saving ? _continue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        disabledBackgroundColor: AppColors.bgCardLight,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: _saving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _currentStep == _stepCount - 1
                                  ? widget.isEditing
                                        ? l10n.common_save
                                        : l10n.onboarding_finish
                                  : l10n.onboarding_continue,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepLayout({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 34, 20, 24),
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 28),
        child,
      ],
    );
  }

  Widget _buildGoalStep(S l10n) {
    return _stepLayout(
      title: l10n.onboarding_goalTitle,
      subtitle: l10n.onboarding_goalSubtitle,
      child: Column(
        children: [
          _SelectionCard(
            icon: Icons.fitness_center_rounded,
            label: l10n.onboarding_goalMuscle,
            selected: _goal == TrainingGoal.muscleGain,
            onTap: () => setState(() => _goal = TrainingGoal.muscleGain),
          ),
          _SelectionCard(
            icon: Icons.bolt_rounded,
            label: l10n.onboarding_goalStrength,
            selected: _goal == TrainingGoal.strength,
            onTap: () => setState(() => _goal = TrainingGoal.strength),
          ),
          _SelectionCard(
            icon: Icons.local_fire_department_rounded,
            label: l10n.onboarding_goalFatLoss,
            selected: _goal == TrainingGoal.fatLoss,
            onTap: () => setState(() => _goal = TrainingGoal.fatLoss),
          ),
          _SelectionCard(
            icon: Icons.favorite_rounded,
            label: l10n.onboarding_goalFitness,
            selected: _goal == TrainingGoal.generalFitness,
            onTap: () => setState(() => _goal = TrainingGoal.generalFitness),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceStep(S l10n) {
    return _stepLayout(
      title: l10n.onboarding_experienceTitle,
      subtitle: l10n.onboarding_experienceSubtitle,
      child: Column(
        children: [
          _SelectionCard(
            icon: Icons.eco_rounded,
            label: l10n.onboarding_experienceBeginner,
            subtitle: l10n.onboarding_experienceBeginnerHint,
            selected: _experience == ExperienceLevel.beginner,
            onTap: () => setState(() => _experience = ExperienceLevel.beginner),
          ),
          _SelectionCard(
            icon: Icons.trending_up_rounded,
            label: l10n.onboarding_experienceIntermediate,
            subtitle: l10n.onboarding_experienceIntermediateHint,
            selected: _experience == ExperienceLevel.intermediate,
            onTap: () =>
                setState(() => _experience = ExperienceLevel.intermediate),
          ),
          _SelectionCard(
            icon: Icons.emoji_events_rounded,
            label: l10n.onboarding_experienceAdvanced,
            subtitle: l10n.onboarding_experienceAdvancedHint,
            selected: _experience == ExperienceLevel.advanced,
            onTap: () => setState(() => _experience = ExperienceLevel.advanced),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysStep(S l10n) {
    return _stepLayout(
      title: l10n.onboarding_daysTitle,
      subtitle: l10n.onboarding_daysSubtitle,
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: List.generate(7, (index) {
              final value = index + 1;
              final selected = value == _daysPerWeek;
              return InkWell(
                onTap: () => setState(() => _daysPerWeek = value),
                borderRadius: BorderRadius.circular(15),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.bgCard,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: selected
                          ? AppColors.primaryLight
                          : AppColors.bgCardLight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.onboarding_daysSelected(_daysPerWeek),
            style: const TextStyle(
              color: AppColors.primaryLight,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentStep(S l10n) {
    final options = <(TrainingEquipment, IconData, String)>[
      (
        TrainingEquipment.noEquipment,
        Icons.accessibility_new_rounded,
        l10n.equipment_noEquipment,
      ),
      (
        TrainingEquipment.dumbbells,
        Icons.fitness_center_rounded,
        l10n.equipment_dumbbells,
      ),
      (
        TrainingEquipment.barbell,
        Icons.horizontal_rule_rounded,
        l10n.equipment_barbell,
      ),
      (
        TrainingEquipment.machines,
        Icons.precision_manufacturing_rounded,
        l10n.equipment_machine,
      ),
      (TrainingEquipment.cable, Icons.cable_rounded, l10n.equipment_cable),
      (
        TrainingEquipment.pullUpBar,
        Icons.sports_gymnastics_rounded,
        l10n.equipment_pullupBar,
      ),
    ];

    return _stepLayout(
      title: l10n.onboarding_equipmentTitle,
      subtitle: l10n.onboarding_equipmentSubtitle,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = (constraints.maxWidth - 10) / 2;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: options.map((option) {
              return SizedBox(
                width: width,
                child: _EquipmentCard(
                  icon: option.$2,
                  label: option.$3,
                  selected: _equipment.contains(option.$1),
                  onTap: () => _toggleEquipment(option.$1),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _SelectionCard({
    required this.icon,
    required this.label,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withAlpha(28)
                : AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.bgCardLight,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.primary.withAlpha(42)
                      : AppColors.bgCardLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: selected
                      ? AppColors.primaryLight
                      : AppColors.textSecondary,
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                selected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: selected ? AppColors.primary : AppColors.textMuted,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _EquipmentCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: const BoxConstraints(minHeight: 92),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withAlpha(28) : AppColors.bgCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.bgCardLight,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: selected
                      ? AppColors.primaryLight
                      : AppColors.textSecondary,
                  size: 22,
                ),
                if (selected)
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: 19,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
