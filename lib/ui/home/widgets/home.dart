import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? 'Bom dia'
        : hour < 18
            ? 'Boa tarde'
            : 'Boa noite';

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
      children: [
        _CyclePhaseCard(greeting: greeting),
        const SizedBox(height: 14),
        _SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('📋', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 6),
                  Text('Sintomas de hoje',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: AppColors.foreground,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Nenhum sintoma registrado hoje.',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => context.go('/menstrual-cycle'),
                child: Text(
                  '+ Registrar sintomas',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.notifications_rounded,
                      size: 16, color: AppColors.lilas),
                  const SizedBox(width: 6),
                  Text('Próximos lembretes',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: AppColors.foreground,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              _ReminderTile(title: 'Exame preventivo', date: '24 mai'),
              const SizedBox(height: 6),
              _ReminderTile(title: 'Autoexame de mamas', date: '01 jun'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withValues(alpha: 0.10),
                AppColors.lilasLight,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome_rounded,
                      size: 16, color: AppColors.primary),
                  const SizedBox(width: 6),
                  Text('Dica de saúde do dia',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: AppColors.foreground,
                      )),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Beba ao menos 8 copos de água por dia para apoiar seu equilíbrio hormonal e bem-estar.',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  height: 1.5,
                  color: AppColors.foreground.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CyclePhaseCard extends StatelessWidget {
  final String greeting;
  const _CyclePhaseCard({required this.greeting});

  @override
  Widget build(BuildContext context) {
    return _SoftCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$greeting 💜',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                    )),
                const SizedBox(height: 2),
                Text('Dia 12 do ciclo',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                    )),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lilasLight,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Fase Folicular',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppColors.lilas,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('16',
                  style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  )),
              Text('dias p/ próxima',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: AppColors.mutedForeground,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReminderTile extends StatelessWidget {
  final String title;
  final String date;
  const _ReminderTile({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondaryFg,
                    )),
                Text(date,
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      color: AppColors.mutedForeground,
                    )),
              ],
            ),
          ),
          const Icon(Icons.calendar_today_rounded,
              size: 16, color: AppColors.mutedForeground),
        ],
      ),
    );
  }
}

class _SoftCard extends StatelessWidget {
  final Widget child;
  const _SoftCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
