import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatelessWidget {
  final Widget child;

  const Shell({
    super.key,
    required this.child,
  });

  static final List<({String path, IconData icon, String label, bool isPrimary})> _destinations = [
    (path: '/home', icon: Icons.home, label: 'Home', isPrimary: true),
    (path: '/menstrual-cycle', icon: Icons.loop, label: 'Ciclo Menstrual', isPrimary: true),
    (path: '/self-care', icon: Icons.favorite, label: 'Autocuidado', isPrimary: true),
    (path: '/breast-cancer', icon: Icons.health_and_safety, label: 'Prevenção Mama', isPrimary: true),
    (path: '/vaginal-discharge', icon: Icons.water_drop, label: 'Corrimento', isPrimary: false),
    (path: '/menstrual-cramps', icon: Icons.healing, label: 'Cólicas', isPrimary: false),
    (path: '/missed-period', icon: Icons.calendar_today, label: 'Atraso', isPrimary: false),
    (path: '/bleeding-between-periods', icon: Icons.warning_amber, label: 'Sangramento', isPrimary: false),
    (path: '/pain-while-urinating', icon: Icons.local_fire_department, label: 'Dor Urinar', isPrimary: false),
    (path: '/pms-emotions', icon: Icons.mood_bad, label: 'TPM', isPrimary: false),
    (path: '/cervical-cancer', icon: Icons.biotech, label: 'Câncer Colo', isPrimary: false),
    (path: '/violence-against-women', icon: Icons.security, label: 'Violência', isPrimary: false),
    (path: '/perimenopause-menopause', icon: Icons.wb_sunny, label: 'Menopausa', isPrimary: false),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final currentIndex = _getSelectedIndex(context);

    if (isMobile) {
      final primaryDestinations = _destinations.where((d) => d.isPrimary).toList();
      final currentBottomIndex = primaryDestinations.indexWhere(
        (d) => d.path == GoRouterState.of(context).matchedLocation
      );

      return Scaffold(
        appBar: AppBar(title: const Text('Saúde da Mulher')),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Center(child: Text("Menu Completo"))),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ..._destinations.map((d) => ListTile(
                      leading: Icon(d.icon),
                      title: Text(d.label),
                      selected: _destinations.indexOf(d) == currentIndex,
                      onTap: () {
                        context.go(d.path);
                        Navigator.pop(context);
                      },
                    )),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () => context.go('/login'),
              )
            ],
          ),
        ),
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentBottomIndex == -1 ? 0 : currentBottomIndex,
          onDestinationSelected: (index) => context.go(primaryDestinations[index].path),
          destinations: primaryDestinations.map((d) => NavigationDestination(
            icon: Icon(d.icon),
            label: d.label,
          )).toList(),
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
                      onDestinationSelected: (index) => context.go(_destinations[index].path),
                      labelType: NavigationRailLabelType.all,
                      leading: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Icon(Icons.female, size: 40, color: Colors.pink),
                      ),
                      destinations: _destinations.map((d) => NavigationRailDestination(
                        icon: Icon(d.icon),
                        label: Text(d.label),
                      )).toList(),
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