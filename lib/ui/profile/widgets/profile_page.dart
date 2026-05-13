import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:woman_health/ui/core/theme/app_theme.dart';
import 'package:woman_health/ui/profile/view_models/profile_scope.dart';
import 'package:woman_health/ui/profile/widgets/header.dart';
import 'package:woman_health/ui/profile/widgets/info_row.dart';
import 'package:woman_health/ui/profile/widgets/link_card.dart';
import 'package:woman_health/ui/profile/widgets/section_card.dart';
import 'package:woman_health/ui/profile/widgets/stat_card.dart';
import 'package:woman_health/ui/profile/widgets/toggle_row.dart';

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
    final viewModel = ProfileScope.of(context);

    if (viewModel.cycle == null) {
      viewModel.loadCycle();
    }

    return ListenableBuilder(
      listenable: viewModel, 
      builder: (context, child) =>
        ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
          children: [
            ProfileHeader(email: viewModel.email!),
            const SizedBox(height: 16),
            SectionCard(
              icon: Icons.calendar_month_rounded,
              iconColor: AppColors.rosa,
              title: 'Informações do ciclo',
              child: Column(
                children: viewModel.isLoading
                  ? [const Center(child: CircularProgressIndicator())]
                  : [
                    InfoRow(label: 'Duração média do ciclo', value: '${viewModel.cycle!.avarageDuration ?? 'N/A'} dias'),
                    InfoRow(label: 'Duração média do período', value: '${viewModel.cycle!.avaragePeriodDuration ?? 'N/A'} dias'),
                    InfoRow(label: 'Última menstruação', value: viewModel.cycle!.lastCicle?.toIso8601String() ?? 'N/A'),
                  ]
              ),
            ),
            const SizedBox(height: 12),
            SectionCard(
              icon: Icons.bar_chart_rounded,
              iconColor: AppColors.lilas,
              title: 'Estatísticas',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  viewModel.isLoading
                    ? CircularProgressIndicator()
                    : Expanded(child: StatCard(value: viewModel.cycle!.amount.toString(), label: 'Ciclos')),
                  SizedBox(width: 8),
                  viewModel.isLoading
                    ? CircularProgressIndicator()
                    : Expanded(child: StatCard(value: viewModel.cycle!.regularity, label: 'Regularidade')),
                  SizedBox(width: 8),
                  viewModel.isLoading
                    ? CircularProgressIndicator()
                    : Expanded(child: StatCard(value: '${viewModel.cycle!.avaragePeriodDuration}d', label: 'Duração média')),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SectionCard(
              icon: Icons.settings_rounded,
              iconColor: AppColors.roxo,
              title: 'Configurações',
              child: Column(
                children: [
                  ToggleRow(
                    icon: Icons.notifications_rounded,
                    label: 'Notificações',
                    value: notifications,
                    onChanged: (v) => setState(() => notifications = v),
                  ),
                  const SizedBox(height: 8),
                  ToggleRow(
                    icon: Icons.shield_rounded,
                    label: 'Compartilhamento de dados',
                    value: dataSharing,
                    onChanged: (v) => setState(() => dataSharing = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            LinkCard(
              emoji: '🛡️',
              label: 'Suporte e acolhimento',
              onTap: () => context.go('/violence-against-women'),
            ),
            const SizedBox(height: 8),
            LinkCard(
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
        )
    );
  }
}


