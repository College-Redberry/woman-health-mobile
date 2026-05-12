import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  static const List<({String path, String emoji, String label, String summary})> items = [
    (path: '/vaginal-discharge', emoji: '💧', label: 'Corrimento vaginal', summary: 'O que é normal e quando procurar a UBS.'),
    (path: '/menstrual-cramps', emoji: '🩹', label: 'Cólica', summary: 'Como aliviar e quando se preocupar.'),
    (path: '/missed-period', emoji: '📆', label: 'Atraso menstrual', summary: 'O que considerar diante de um atraso.'),
    (path: '/bleeding-between-periods', emoji: '⚠️', label: 'Sangramento fora do período', summary: 'Sinais e cuidados a observar.'),
    (path: '/pain-while-urinating', emoji: '🔥', label: 'Dor ou ardor ao urinar', summary: 'Sintomas associados e alertas.'),
    (path: '/menstrual-cycle', emoji: '🔄', label: 'Conheça seu ciclo menstrual', summary: 'Entenda as fases do ciclo.'),
    (path: '/pms-emotions', emoji: '🌧️', label: 'TPM e alterações emocionais', summary: 'O que acontece antes da menstruação.'),
    (path: '/cervical-cancer', emoji: '🧬', label: 'Câncer de colo do útero', summary: 'Prevenção, rastreio e Papanicolau.'),
    (path: '/breast-cancer', emoji: '🎀', label: 'Câncer de mama', summary: 'Autoexame, mamografia e prevenção.'),
    (path: '/violence-against-women', emoji: '🛡️', label: 'Violência contra a mulher', summary: 'Onde procurar ajuda e violentômetro.'),
    (path: '/perimenopause-menopause', emoji: '🌅', label: 'Climatério e menopausa', summary: 'Sintomas, cuidados e transição.'),
    (path: '/self-care', emoji: '💖', label: 'Autocuidado e hábitos saudáveis', summary: 'Rotina para a sua saúde.'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = items[index];
        return _ContentCard(
          emoji: item.emoji,
          label: item.label,
          summary: item.summary,
          onTap: () => context.go(item.path),
        );
      },
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String emoji;
  final String label;
  final String summary;
  final VoidCallback onTap;

  const _ContentCard({
    required this.emoji,
    required this.label,
    required this.summary,
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
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(emoji, style: const TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
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
