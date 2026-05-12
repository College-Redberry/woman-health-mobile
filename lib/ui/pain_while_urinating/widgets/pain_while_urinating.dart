import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class PainWhileUrinatingPage extends StatelessWidget {
  const PainWhileUrinatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      title: 'Dor ou ardor ao urinar',
      sections: [
        HealthSection(
          title: 'Sintomas associados:',
          bullets: [
            'Sente urgência em urinar?',
            'Sente ardor ao urinar? Apenas uma vez? Após relação? Mais de uma vez?',
            'Aumento da frequência urinária?',
            'Sente dor na região inferior do abdômen ou nas costas?',
            'Teve febre?',
          ],
        ),
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Ardor persistente, dor abdominal intensa ou vontade frequente de urinar.',
            'Presença de sangue na urina.',
            'Febre, dor lombar ou calafrios.',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para confirmação e tratamento adequado.',
      references: [
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=9',
        'https://bvsms.saude.gov.br/bvs/publicacoes/protocolos_atencao_basica_saude_mulheres.pdf',
      ],
    );
  }
}
