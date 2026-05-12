import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notifications = true;
  bool dataSharing = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
      children: [
        _ProfileHeader(),
        const SizedBox(height: 16),
        _SectionCard(
          icon: Icons.calendar_month_rounded,
          iconColor: AppColors.rosa,
          title: 'Informações do ciclo',
          child: Column(
            children: const [
              _InfoRow(label: 'Duração média do ciclo', value: '28 dias'),
              _InfoRow(label: 'Duração média do período', value: '5 dias'),
              _InfoRow(label: 'Última menstruação', value: '12/04/2026'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          icon: Icons.bar_chart_rounded,
          iconColor: AppColors.lilas,
          title: 'Estatísticas',
          child: Row(
            children: const [
              Expanded(child: _StatCard(value: '6', label: 'Ciclos')),
              SizedBox(width: 8),
              Expanded(child: _StatCard(value: 'Regular', label: 'Regularidade')),
              SizedBox(width: 8),
              Expanded(child: _StatCard(value: '28d', label: 'Duração média')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          icon: Icons.settings_rounded,
          iconColor: AppColors.roxo,
          title: 'Configurações',
          child: Column(
            children: [
              _ToggleRow(
                icon: Icons.notifications_rounded,
                label: 'Notificações',
                value: notifications,
                onChanged: (v) => setState(() => notifications = v),
              ),
              const SizedBox(height: 8),
              _ToggleRow(
                icon: Icons.shield_rounded,
                label: 'Compartilhamento de dados',
                value: dataSharing,
                onChanged: (v) => setState(() => dataSharing = v),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _LinkCard(
          emoji: '🛡️',
          label: 'Suporte e acolhimento',
          onTap: () => context.go('/violence-against-women'),
        ),
        const SizedBox(height: 8),
        _LinkCard(
          emoji: '🌸',
          label: 'Trilhas por fase da vida',
          onTap: () => context.go('/perimenopause-menopause'),
        ),
        const SizedBox(height: 16),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => context.go('/login'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout_rounded,
                      color: AppColors.destructive, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Sair',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: AppColors.destructive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.18),
            ),
            child: const Icon(Icons.person_rounded,
                size: 44, color: AppColors.primary),
          ),
          const SizedBox(height: 10),
          Text(
            'Bem-vinda',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'usuaria@exemplo.com',
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.edit_rounded,
                    size: 14, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  'Editar perfil',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
  });

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.nunito(
                  fontSize: 12, color: AppColors.mutedForeground)),
          Text(value,
              style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foreground)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              )),
          const SizedBox(height: 2),
          Text(label,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 10,
                color: AppColors.mutedForeground,
              )),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleRow({
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

class _LinkCard extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const _LinkCard({
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
