import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class MenstrualCyclePage extends StatelessWidget {
  const MenstrualCyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      intro: [
        'O ciclo menstrual costuma variar entre 21 e 36 dias, com sangramento de 3 a 7 dias. É normal pequenas variações de duração e intensidade, especialmente em adolescentes, pós-parto e perto da menopausa.',
      ],
      sections: [
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Anotar o ciclo menstrual (dia, duração, intensidade e sintomas).',
            'Fazer compressas mornas para aliviar cólicas.',
            'Manter hidratação e evitar excesso de café e sal durante o período.',
            'Procurar hábitos de relaxamento, como alongamento ou respiração profunda.',
          ],
        ),
      ],
      references: [
        'https://bvsms.saude.gov.br/bvs/publicacoes/politica_nacional_atencao_mulher.pdf',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=75',
      ],
    );
  }
}
