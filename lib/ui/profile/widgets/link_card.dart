import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:woman_health/ui/core/theme/app_theme.dart';

class LinkCard extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const LinkCard({
    super.key, 
    required this.emoji,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(label,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: AppColors.foreground,
                    )),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: AppColors.mutedForeground),
            ],
          ),
        ),
      ),
    );
  }
}
