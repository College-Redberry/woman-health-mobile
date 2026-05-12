import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatelessWidget {
  final Widget child;

  const Shell({super.key, required this.child});

  static final List<
    ({String path, IconData icon, String label, bool isPrimary})
  >
  _destinations = [
    (path: '/home', icon: Icons.home, label: 'Home', isPrimary: true),
    (
      path: '/menstrual-cycle',
      icon: Icons.loop,
      label: 'Ciclo Menstrual',
      isPrimary: true,
    ),
    (
      path: '/self-care',
      icon: Icons.favorite,
      label: 'Autocuidado',
      isPrimary: true,
    ),
    (
      path: '/breast-cancer',
      icon: Icons.health_and_safety,
      label: 'Prevenção Mama',
      isPrimary: true,
    ),
    (
      path: '/vaginal-discharge',
      icon: Icons.water_drop,
      label: 'Corrimento',
      isPrimary: false,
    ),
    (
      path: '/menstrual-cramps',
      icon: Icons.healing,
      label: 'Cólicas',
      isPrimary: false,
    ),
    (
      path: '/missed-period',
      icon: Icons.calendar_today,
      label: 'Atraso',
      isPrimary: false,
    ),
    (
      path: '/bleeding-between-periods',
      icon: Icons.warning_amber,
      label: 'Sangramento',
      isPrimary: false,
    ),
    (
      path: '/pain-while-urinating',
      icon: Icons.local_fire_department,
      label: 'Dor Urinar',
      isPrimary: false,
    ),
    (
      path: '/pms-emotions',
      icon: Icons.mood_bad,
      label: 'TPM',
      isPrimary: false,
    ),
    (
      path: '/cervical-cancer',
      icon: Icons.biotech,
      label: 'Câncer Colo',
      isPrimary: false,
    ),
    (
      path: '/violence-against-women',
      icon: Icons.security,
      label: 'Violência',
      isPrimary: false,
    ),
    (
      path: '/perimenopause-menopause',
      icon: Icons.wb_sunny,
      label: 'Menopausa',
      isPrimary: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final currentIndex = _getSelectedIndex(context);

    if (isMobile) {
      return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Center(child: Text('Menu Completo'))),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ..._destinations.map(
                      (d) => ListTile(
                        leading: Icon(d.icon),
                        title: Text(d.label),
                        selected: _destinations.indexOf(d) == currentIndex,
                        onTap: () {
                          context.go(d.path);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () => context.go('/login'),
              ),
            ],
          ),
        ),
        body: child,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/self-care'),
          backgroundColor: const Color(0xFFD23EB5),
          foregroundColor: Colors.white,
          elevation: 10,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, size: 34),
        ),
        bottomNavigationBar: _MobileBottomBar(
          currentPath: GoRouterState.of(context).matchedLocation,
          onSelected: context.go,
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedIndex: currentIndex,
                      onDestinationSelected: (index) =>
                          context.go(_destinations[index].path),
                      labelType: NavigationRailLabelType.all,
                      leading: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Icon(Icons.female, size: 40, color: Colors.pink),
                      ),
                      destinations: _destinations
                          .map(
                            (d) => NavigationRailDestination(
                              icon: Icon(d.icon),
                              label: Text(d.label),
                            ),
                          )
                          .toList(),
                      trailing: Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: IconButton(
                              icon: const Icon(Icons.logout),
                              onPressed: () => context.go('/login'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const VerticalDivider(width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _destinations.indexWhere((d) => d.path == location);
    return index >= 0 ? index : 0;
  }
}

class _MobileBottomBar extends StatelessWidget {
  final String currentPath;
  final ValueChanged<String> onSelected;

  const _MobileBottomBar({required this.currentPath, required this.onSelected});

  static const _items = [
    (
      path: '/home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Hoje',
    ),
    (
      path: '/menstrual-cycle',
      icon: Icons.calendar_month_outlined,
      selectedIcon: Icons.calendar_month,
      label: 'Ciclo',
    ),
    (
      path: '/breast-cancer',
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book,
      label: 'Conteúdos',
    ),
    (
      path: '/login',
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
      label: 'Perfil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 62,
      padding: EdgeInsets.zero,
      elevation: 16,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          _BottomBarItem(
            item: _items[0],
            selected: currentPath == _items[0].path,
            onTap: () => onSelected(_items[0].path),
          ),
          _BottomBarItem(
            item: _items[1],
            selected: currentPath == _items[1].path,
            onTap: () => onSelected(_items[1].path),
          ),
          const SizedBox(width: 74),
          _BottomBarItem(
            item: _items[2],
            selected: currentPath == _items[2].path,
            onTap: () => onSelected(_items[2].path),
          ),
          _BottomBarItem(
            item: _items[3],
            selected: currentPath == _items[3].path,
            onTap: () => onSelected(_items[3].path),
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final ({String path, IconData icon, IconData selectedIcon, String label})
  item;
  final bool selected;
  final VoidCallback onTap;

  const _BottomBarItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFFD23EB5) : const Color(0xFF88758F);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? item.selectedIcon : item.icon,
                color: color,
                size: 22,
              ),
              const SizedBox(height: 3),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
