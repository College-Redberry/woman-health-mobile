import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class BleedingBetweenPeriodsPage extends StatelessWidget {
  const BleedingBetweenPeriodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      intro: [
        'Fazer um diário para registro de sangramento fora do período menstrual com as datas do calendário e apresentar ao médico durante a consulta.',
      ],
      sections: [
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Observar o volume e frequência do sangramento.',
            'Anotar se há relação com medicamentos ou início de métodos contraceptivos.',
            'Evitar relações sexuais até avaliação se o sangramento for repetido.',
            'Anotar quanto tempo e quais dias você percebeu o sangramento.',
            'Observar se sente mais alguma coisa além do sangramento (exemplo: cólicas).',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para avaliação e exame físico se está com qualquer sangramento fora do período menstrual.',
    );
  }
}
