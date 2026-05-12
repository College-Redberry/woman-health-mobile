import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenstrualCyclePage extends StatelessWidget {
  const MenstrualCyclePage({super.key});

  static const _pink = Color(0xFFD243B9);
  static const _ink = Color(0xFF140022);
  static const _muted = Color(0xFF7F668D);
  static const _period = Color(0xFFF4DCE8);
  static const _fertile = Color(0xFFDDF2E6);
  static const _ovulation = Color(0xFFF5ECDD);
  static const _symptom = Color(0xFFB68AE8);
  static const _shadow = Color(0x10000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 26, 8, 92),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 26),
                child: Text(
                  'Ciclo Menstrual',
                  style: TextStyle(
                    color: _ink,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const _MonthSelector(),
              const SizedBox(height: 28),
              const _CalendarCard(),
              const SizedBox(height: 16),
              const _CycleStats(),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () => context.go('/register-symptoms'),
                  style: FilledButton.styleFrom(
                    backgroundColor: _pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    'Registrar sintomas',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  '⚕  Essas informações não substituem avaliação médica.',
                  style: TextStyle(
                    color: Color(0xFF8C75A0),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterSymptomsPage extends StatelessWidget {
  const RegisterSymptomsPage({super.key});

  static const _symptoms = [
    _Symptom('🔥', 'Cólica'),
    _Symptom('💫', 'Dor pélvica'),
    _Symptom('💧', 'Corrimento'),
    _Symptom('🩸', 'Sangramento fora do período'),
    _Symptom('⚡', 'Ardor ao urinar'),
    _Symptom('😣', 'Dor nas mamas'),
    _Symptom('😳', 'Humor alterado'),
    _Symptom('😰', 'Ansiedade'),
    _Symptom('🫣', 'Irritabilidade'),
    _Symptom('😴', 'Alteração no sono'),
    _Symptom('🫧', 'Inchaço'),
    _Symptom('😵', 'Dor de cabeça'),
    _Symptom('💕', 'Libido alterada'),
    _Symptom('📝', 'Outros'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFC),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(8, 26, 8, 92),
          itemCount: _symptoms.length + 3,
          separatorBuilder: (_, index) {
            if (index == 0 || index == _symptoms.length + 1) {
              return const SizedBox.shrink();
            }

            return const SizedBox(height: 8);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.go('/menstrual-cycle'),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: MenstrualCyclePage._muted,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Voltar',
                            style: TextStyle(
                              color: MenstrualCyclePage._muted,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Registrar Sintomas',
                      style: TextStyle(
                        color: MenstrualCyclePage._ink,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Selecione os sintomas que está sentindo hoje',
                      style: TextStyle(
                        color: MenstrualCyclePage._muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (index == _symptoms.length + 2) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () => context.go('/menstrual-cycle'),
                    style: FilledButton.styleFrom(
                      backgroundColor: MenstrualCyclePage._pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      'Salvar 2 sintoma(s)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              );
            }

            final symptom = _symptoms[index - 1];
            final selected =
                symptom.label == 'Alteração no sono' ||
                symptom.label == 'Inchaço';

            return _SymptomTile(
              symptom: symptom,
              selected: selected,
              intensity: symptom.label == 'Inchaço' ? 'Moderado' : 'Leve',
            );
          },
        ),
      ),
    );
  }
}

class _MonthSelector extends StatelessWidget {
  const _MonthSelector();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.chevron_left, color: MenstrualCyclePage._ink, size: 28),
        Expanded(
          child: Text(
            'Março 2026',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MenstrualCyclePage._ink,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Icon(Icons.chevron_right, color: MenstrualCyclePage._ink, size: 28),
      ],
    );
  }
}

class _CalendarCard extends StatelessWidget {
  const _CalendarCard();

  @override
  Widget build(BuildContext context) {
    const weekDays = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

    return _WhiteCard(
      radius: 22,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      child: Column(
        children: [
          Row(
            children: weekDays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: const TextStyle(
                          color: MenstrualCyclePage._muted,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            itemCount: 35,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisExtent: 43,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              final day = index + 1;
              final style = _DayStyle.forDay(day);

              if (day > 31) {
                return const SizedBox.shrink();
              }

              return _CalendarDay(day: day, style: style);
            },
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEDE5F0), height: 1),
          const SizedBox(height: 12),
          const _CalendarLegend(),
        ],
      ),
    );
  }
}

class _CalendarDay extends StatelessWidget {
  final int day;
  final _DayStyle style;

  const _CalendarDay({required this.day, required this.style});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: style.highlight ? double.infinity : 40,
          height: 40,
          decoration: BoxDecoration(
            color: style.background,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(
                color: style.textColor,
                fontSize: 14,
                fontWeight: style.highlight ? FontWeight.w800 : FontWeight.w500,
              ),
            ),
          ),
        ),
        if (day == 19)
          const Positioned(
            bottom: 4,
            child: CircleAvatar(
              radius: 3,
              backgroundColor: MenstrualCyclePage._symptom,
            ),
          ),
      ],
    );
  }
}

class _CalendarLegend extends StatelessWidget {
  const _CalendarLegend();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _LegendItem(color: MenstrualCyclePage._period, label: 'Menstruação'),
        SizedBox(width: 10),
        _LegendItem(
          color: MenstrualCyclePage._fertile,
          label: 'Período fértil',
        ),
        SizedBox(width: 10),
        _LegendItem(color: MenstrualCyclePage._ovulation, label: 'Ovulação'),
        SizedBox(width: 10),
        _LegendItem(color: MenstrualCyclePage._symptom, label: 'Sintoma'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 6, backgroundColor: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: MenstrualCyclePage._muted,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleStats extends StatelessWidget {
  const _CycleStats();

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.05,
      ),
      children: const [
        _StatCard(icon: '🩸', value: '15 dias', label: 'Próxima menstruação'),
        _StatCard(icon: '🗓️', value: '28 dias', label: 'Duração média'),
        _StatCard(
          icon: '🗓️',
          value: '04 de mar.',
          label: 'Última menstruação',
        ),
        _StatCard(icon: '📋', value: '2', label: 'Sintomas registrados'),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return _WhiteCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 19)),
          const SizedBox(height: 8),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: MenstrualCyclePage._ink,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: MenstrualCyclePage._muted,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SymptomTile extends StatelessWidget {
  final _Symptom symptom;
  final bool selected;
  final String intensity;

  const _SymptomTile({
    required this.symptom,
    required this.selected,
    required this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    if (!selected) {
      return _WhiteCard(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Text(symptom.icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                symptom.label,
                style: const TextStyle(
                  color: MenstrualCyclePage._ink,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return _WhiteCard(
      padding: EdgeInsets.zero,
      color: const Color(0xFFFFFAFF),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 16, 16),
            child: Row(
              children: [
                Text(symptom.icon, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    symptom.label,
                    style: const TextStyle(
                      color: MenstrualCyclePage._ink,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: MenstrualCyclePage._pink,
                  child: Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Intensidade:',
                  style: TextStyle(
                    color: MenstrualCyclePage._muted,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _IntensityPill(
                      label: 'Leve',
                      selected: intensity == 'Leve',
                      outlined: false,
                    ),
                    const SizedBox(width: 8),
                    _IntensityPill(
                      label: 'Moderado',
                      selected: intensity == 'Moderado',
                      outlined: intensity == 'Moderado',
                    ),
                    const SizedBox(width: 8),
                    _IntensityPill(
                      label: 'Intenso',
                      selected: intensity == 'Intenso',
                      outlined: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IntensityPill extends StatelessWidget {
  final String label;
  final bool selected;
  final bool outlined;

  const _IntensityPill({
    required this.label,
    required this.selected,
    required this.outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? MenstrualCyclePage._pink : const Color(0xFFF0E9F4),
          borderRadius: BorderRadius.circular(999),
          border: outlined
              ? Border.all(color: MenstrualCyclePage._ink, width: 2)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : MenstrualCyclePage._ink,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _WhiteCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color color;

  const _WhiteCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 22,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: MenstrualCyclePage._shadow,
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _DayStyle {
  final bool highlight;
  final Color background;
  final Color textColor;

  const _DayStyle({
    required this.highlight,
    required this.background,
    required this.textColor,
  });

  factory _DayStyle.forDay(int day) {
    if ([5, 6, 7, 8, 9].contains(day)) {
      return const _DayStyle(
        highlight: true,
        background: MenstrualCyclePage._period,
        textColor: Color(0xFFE36094),
      );
    }

    if ([15, 16, 17, 18, 20, 21].contains(day)) {
      return const _DayStyle(
        highlight: true,
        background: MenstrualCyclePage._fertile,
        textColor: Color(0xFF35B86E),
      );
    }

    if (day == 19) {
      return const _DayStyle(
        highlight: true,
        background: MenstrualCyclePage._ovulation,
        textColor: Color(0xFFE99532),
      );
    }

    return const _DayStyle(
      highlight: false,
      background: Colors.transparent,
      textColor: MenstrualCyclePage._ink,
    );
  }
}

class _Symptom {
  final String icon;
  final String label;

  const _Symptom(this.icon, this.label);
}
