import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class MissedPeriodPage extends StatelessWidget {
  const MissedPeriodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      sections: [
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Atraso de 15 dias ou mais; ou',
            'Teste de gravidez positivo.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Fazer um teste de gravidez se o atraso for maior que 15 dias.',
            'Anotar seus ciclos para observar um padrão.',
            'Evitar automedicação.',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para confirmação e acompanhamento.',
      references: [
        'https://wiki.smsbrusque.sc.gov.br/images/c/cc/PROTOCOLO_DE_PN_2022_PDF_%281%29_compressed.pdf',
      ],
    );
  }
}
