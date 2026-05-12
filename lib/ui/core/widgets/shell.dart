import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

class Shell extends StatelessWidget {
  final Widget child;

  const Shell({
    super.key,
    required this.child,
  });

  static const List<({String path, IconData icon, String label})> _bottomDestinations = [
    (path: '/home', icon: Icons.home_rounded, label: 'Hoje'),
    (path: '/menstrual-cycle', icon: Icons.calendar_month_rounded, label: 'Ciclo'),
    (path: '/content', icon: Icons.menu_book_rounded, label: 'Conteúdos'),
    (path: '/profile', icon: Icons.person_rounded, label: 'Perfil'),
  ];

  static const List<({String path, IconData icon, String label})> _contentItems = [
    (path: '/vaginal-discharge', icon: Icons.water_drop_rounded, label: 'Corrimento'),
    (path: '/menstrual-cramps', icon: Icons.healing_rounded, label: 'Cólicas'),
    (path: '/missed-period', icon: Icons.calendar_today_rounded, label: 'Atraso'),
    (path: '/bleeding-between-periods', icon: Icons.warning_amber_rounded, label: 'Sangramento'),
    (path: '/pain-while-urinating', icon: Icons.local_fire_department_rounded, label: 'Dor Urinar'),
    (path: '/pms-emotions', icon: Icons.mood_bad_rounded, label: 'TPM'),
    (path: '/cervical-cancer', icon: Icons.biotech_rounded, label: 'Câncer Colo'),
    (path: '/breast-cancer', icon: Icons.health_and_safety_rounded, label: 'Câncer Mama'),
    (path: '/violence-against-women', icon: Icons.security_rounded, label: 'Violência'),
    (path: '/perimenopause-menopause', icon: Icons.wb_sunny_rounded, label: 'Menopausa'),
    (path: '/self-care', icon: Icons.favorite_rounded, label: 'Autocuidado'),
  ];

  static const Map<String, String> _titles = {
    '/home': 'Saúde da Mulher',
    '/menstrual-cycle': 'Ciclo menstrual',
    '/content': 'Conteúdos',
    '/profile': 'Perfil',
    '/vaginal-discharge': 'Corrimento vaginal',
    '/menstrual-cramps': 'Cólica',
    '/missed-period': 'Atraso menstrual',
    '/bleeding-between-periods': 'Sangramento fora do período',
    '/pain-while-urinating': 'Dor ou ardor ao urinar',
    '/pms-emotions': 'TPM e alterações emocionais',
    '/cervical-cancer': 'Câncer de colo do útero',
    '/breast-cancer': 'Câncer de mama',
    '/violence-against-women': 'Violência contra a mulher',
    '/perimenopause-menopause': 'Climatério e menopausa',
    '/self-care': 'Autocuidado e hábitos saudáveis',
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 700;
    final location = GoRouterState.of(context).matchedLocation;

    final contentPaths = _contentItems.map((e) => e.path).toSet();
    final isContentSubpage = contentPaths.contains(location);
    final title = _titles[location] ?? 'Saúde da Mulher';

    final header = _GradientHeader(
      title: title,
      showBack: isContentSubpage,
      onBack: () => context.go('/content'),
    );

    if (isMobile) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            header,
            Expanded(child: child),
          ],
        ),
        floatingActionButton: _CenterFab(
          onPressed: () => _showQuickActions(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _BottomNav(
          destinations: _bottomDestinations,
          contentPaths: contentPaths,
          location: location,
          onTap: (path) => context.go(path),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          _DesktopSidebar(location: location),
          const VerticalDivider(width: 1, color: AppColors.border),
          Expanded(
            child: Column(
              children: [
                header,
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _QuickActionsSheet(
        onSelect: (path) {
          Navigator.pop(context);
          context.go(path);
        },
      ),
    );
  }
}

class _GradientHeader extends StatelessWidget {
  final String title;
  final bool showBack;
  final VoidCallback onBack;

  const _GradientHeader({
    required this.title,
    required this.showBack,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, mediaTop + 16, 20, 24),
      decoration: const BoxDecoration(
        gradient: AppColors.headerGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBack)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                color: Colors.white.withValues(alpha: 0.7),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onBack,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_rounded,
                        color: AppColors.roxo, size: 20),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.foreground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final List<({String path, IconData icon, String label})> destinations;
  final Set<String> contentPaths;
  final String location;
  final ValueChanged<String> onTap;

  const _BottomNav({
    required this.destinations,
    required this.contentPaths,
    required this.location,
    required this.onTap,
  });

  bool _isSelected(int i) {
    final dest = destinations[i];
    if (dest.path == '/content') {
      return location == '/content' || contentPaths.contains(location);
    }
    return location == dest.path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navButton(0),
              _navButton(1),
              const SizedBox(width: 56),
              _navButton(2),
              _navButton(3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(int i) {
    final dest = destinations[i];
    final selected = _isSelected(i);
    final color = selected ? AppColors.primary : AppColors.mutedForeground;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(dest.path),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(dest.icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              dest.label,
              style: GoogleFonts.nunito(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterFab extends StatelessWidget {
  final VoidCallback onPressed;

  const _CenterFab({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryFg,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }
}

class _QuickActionsSheet extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const _QuickActionsSheet({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (
        icon: Icons.water_drop_rounded,
        label: 'Registrar sintoma',
        color: AppColors.rosa,
        path: '/menstrual-cycle',
      ),
      (
        icon: Icons.menu_book_rounded,
        label: 'Ler conteúdos',
        color: AppColors.roxo,
        path: '/content',
      ),
      (
        icon: Icons.favorite_rounded,
        label: 'Autocuidado',
        color: AppColors.lilas,
        path: '/self-care',
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ações rápidas',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          ...actions.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => onSelect(a.path),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: a.color.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(a.icon, color: a.color, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          a.label,
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foreground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopSidebar extends StatefulWidget {
  final String location;

  const _DesktopSidebar({required this.location});

  @override
  State<_DesktopSidebar> createState() => _DesktopSidebarState();
}

class _DesktopSidebarState extends State<_DesktopSidebar> {
  @override
  Widget build(BuildContext context) {
    final contentPaths = Shell._contentItems.map((e) => e.path).toSet();
    final isContentSection =
        widget.location == '/content' || contentPaths.contains(widget.location);

    return Container(
      width: 260,
      color: AppColors.card,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_rounded,
                      color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 10),
                Text(
                  'Saúde',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _tile(
                  icon: Icons.home_rounded,
                  label: 'Hoje',
                  path: '/home',
                  selected: widget.location == '/home',
                ),
                _tile(
                  icon: Icons.calendar_month_rounded,
                  label: 'Ciclo',
                  path: '/menstrual-cycle',
                  selected: widget.location == '/menstrual-cycle',
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: const Icon(Icons.menu_book_rounded,
                        color: AppColors.roxo),
                    title: Text('Conteúdos',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          color: AppColors.foreground,
                        )),
                    initiallyExpanded: isContentSection,
                    childrenPadding: const EdgeInsets.only(left: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    children: Shell._contentItems
                        .map((item) => _tile(
                              icon: item.icon,
                              label: item.label,
                              path: item.path,
                              selected: widget.location == item.path,
                              dense: true,
                            ))
                        .toList(),
                  ),
                ),
                _tile(
                  icon: Icons.person_rounded,
                  label: 'Perfil',
                  path: '/profile',
                  selected: widget.location == '/profile',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _tile(
            icon: Icons.logout_rounded,
            label: 'Sair',
            path: '/login',
            selected: false,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _tile({
    required IconData icon,
    required String label,
    required String path,
    required bool selected,
    bool dense = false,
  }) {
    final color = selected ? AppColors.primary : AppColors.foreground;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: selected
            ? AppColors.primary.withValues(alpha: 0.10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => context.go(path),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 14, vertical: dense ? 8 : 12),
            child: Row(
              children: [
                Icon(icon, color: color, size: dense ? 18 : 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.nunito(
                      fontWeight:
                          selected ? FontWeight.w800 : FontWeight.w600,
                      color: color,
                      fontSize: dense ? 13 : 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
