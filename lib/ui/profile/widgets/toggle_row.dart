import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:woman_health/ui/core/theme/app_theme.dart';

class ToggleRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleRow({
    super.key, 
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.foreground),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  color: AppColors.foreground,
                )),
          ],
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.primaryFg,
          activeTrackColor: AppColors.primary,
        ),
      ],
    );
  }
}

