import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_roles.dart';

/// Chip visual para mostrar el rol del usuario actual (perfil, listas de usuarios, etc.)
class RoleBadge extends StatelessWidget {
  final AppRole role;
  final bool compact;

  const RoleBadge({super.key, required this.role, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentSoft),
      ),
      child: Text(
        role.label,
        style: TextStyle(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w600,
          fontSize: compact ? 11 : 13,
        ),
      ),
    );
  }
}
