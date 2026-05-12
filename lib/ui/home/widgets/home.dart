import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _pink = Color(0xFFD23EB5);
  static const _deepPurple = Color(0xFF2F1247);
  static const _mutedPurple = Color(0xFF7E638C);
  static const _softLilac = Color(0xFFF1EAF6);
  static const _cardShadow = Color(0x12000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFBFC),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              const _Header(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                child: Column(
                  children: const [
                    _SymptomsCard(),
                    SizedBox(height: 18),
                    _RemindersCard(),
                    SizedBox(height: 16),
                    _DailyTipCard(),
                    SizedBox(height: 16),
                    _MedicalNoticeCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 46,
        20,
        24,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF7DDEB),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Greeting(),
          SizedBox(height: 16),
          _CycleSummaryCard(),
        ],
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: Color(0xFFF3B5E7),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.favorite_border_rounded,
            color: HomePage._pink,
            size: 28,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Boa tarde  💜',
              style: TextStyle(
                color: HomePage._mutedPurple,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Maria',
              style: TextStyle(
                color: HomePage._deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CycleSummaryCard extends StatelessWidget {
  const _CycleSummaryCard();

  @override
  Widget build(BuildContext context) {
    return _SoftCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
      radius: 20,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dia 13 do ciclo',
                  style: TextStyle(
                    color: HomePage._mutedPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: HomePage._softLilac,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Fase Folicular',
                    style: TextStyle(
                      color: Color(0xFFB988D2),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '15',
                style: TextStyle(
                  color: HomePage._pink,
                  fontSize: 26,
                  height: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'dias para a próxima',
                style: TextStyle(
                  color: HomePage._mutedPurple,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SymptomsCard extends StatelessWidget {
  const _SymptomsCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.receipt_long_outlined,
      iconColor: Color(0xFFE08A69),
      title: 'Sintomas de hoje',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 14),
          Text(
            'Nenhum sintoma registrado hoje.',
            style: TextStyle(
              color: HomePage._mutedPurple,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '+ Registrar sintomas',
            style: TextStyle(
              color: HomePage._pink,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _RemindersCard extends StatelessWidget {
  const _RemindersCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.notifications_none_rounded,
      iconColor: Color(0xFFB45DE8),
      title: 'Próximos lembretes',
      child: Column(
        children: const [
          SizedBox(height: 14),
          _ReminderTile(title: 'Exame preventivo', date: '09 de abr.'),
          SizedBox(height: 9),
          _ReminderTile(title: 'Mamografia anual', date: '14 de mai.'),
          SizedBox(height: 9),
          _ReminderTile(title: 'Consulta ginecológica', date: '24 de mar.'),
          SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ver todos os lembretes',
              style: TextStyle(
                color: HomePage._pink,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
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
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: HomePage._softLilac,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: HomePage._deepPurple,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  date,
                  style: const TextStyle(
                    color: HomePage._mutedPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.calendar_month_outlined,
            color: HomePage._mutedPurple,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _DailyTipCard extends StatelessWidget {
  const _DailyTipCard();

  @override
  Widget build(BuildContext context) {
    return _SoftCard(
      color: const Color(0xFFF5E8F6),
      radius: 20,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SectionTitle(
            icon: Icons.auto_awesome_rounded,
            iconColor: HomePage._pink,
            title: 'Dica de saúde do dia',
          ),
          SizedBox(height: 12),
          Text(
            'Use roupas íntimas de algodão para manter a saúde da região íntima.',
            style: TextStyle(
              color: HomePage._deepPurple,
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicalNoticeCard extends StatelessWidget {
  const _MedicalNoticeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EAF6),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4D1EE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.warning_amber_rounded, color: Color(0xFFA829E8), size: 21),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Estas informações não substituem avaliação médica. Procure sempre a UBS para confirmação e acompanhamento.',
              style: TextStyle(
                color: Color(0xFF7D3A8C),
                fontSize: 11,
                height: 1.45,
                fontWeight: FontWeight.w500,
              ),
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
    return _SoftCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: icon, iconColor: iconColor, title: title),
          child,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;

  const _SectionTitle({
    required this.icon,
    required this.iconColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 17),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF16001F),
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color color;

  const _SoftCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 24,
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
            color: HomePage._cardShadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
