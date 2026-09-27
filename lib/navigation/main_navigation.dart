import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../screens/home/home_screen.dart';
import '../screens/train/train_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/progress/progress_screen.dart';
import '../theme/app_theme.dart';
import '../utils/ui_scale.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onNavigate: _navigateTo),
      TrainScreen(onSessionRestored: () => _navigateTo(AppTab.train)),
      const ProgressScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  Widget _buildNavBar() {
    final items = [
      _NavItem(icon: Icons.home_rounded, label: S.of(context).nav_home),
      _NavItem(
        icon: Icons.fitness_center_rounded,
        label: S.of(context).nav_train,
      ),
      _NavItem(icon: Icons.insights_rounded, label: S.of(context).nav_progress),
      _NavItem(icon: Icons.person_rounded, label: S.of(context).nav_profile),
    ];

    // Icons / bar height are fixed sizes that textScaler can't reach, so we
    // scale them by the same width factor to keep the bar proportional on
    // wide windows (labels are already handled by textScaler).
    final scale = uiScaleForWidth(MediaQuery.of(context).size.width);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: Border(top: BorderSide(color: AppColors.bgCardLight, width: 1)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 62 * scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == _currentIndex;

              return Semantics(
                label: item.label,
                button: true,
                selected: isSelected,
                child: ExcludeSemantics(
                  child: GestureDetector(
                    onTap: () => _navigateTo(index),
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 72 * scale,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14 * scale,
                              vertical: 6 * scale,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary.withAlpha(38)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12 * scale),
                            ),
                            child: Icon(
                              item.icon,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textMuted,
                              size: (isSelected ? 22 : 20) * scale,
                            ),
                          ),
                          SizedBox(height: 2 * scale),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textMuted,
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                            child: Text(item.label),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
