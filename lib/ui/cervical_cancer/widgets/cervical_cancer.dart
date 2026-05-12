import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class CervicalCancerPage extends StatelessWidget {
  const CervicalCancerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      sections: [
        HealthSection(
          title: 'O que é normal:',
          paragraphs: [
            'Fazer o exame preventivo (Papanicolau) regularmente faz parte do cuidado com a saúde da mulher. Ele ajuda a identificar alterações antes que virem câncer.',
            'Se você tem entre 25 e 64 anos, independentemente da orientação sexual, incluindo mulheres que fazem sexo com outras mulheres que já tenham tido penetração (grupo que menos se submete ao exame) e homens trans, você deve procurar a UBS para realizar o exame. O rastreamento deve ser realizado a partir de 25 anos em todas as mulheres que iniciaram atividade sexual.',
            'Ficou em dúvida? Procure a sua UBS de referência!',
          ],
        ),
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Se nunca fez o exame preventivo (Papanicolau).',
            'Se está há mais de 1 ano sem realizar o exame.',
            'Se apresenta sangramento fora do período menstrual ou após relação.',
            'Se tem corrimento persistente com cheiro forte ou diferente do habitual.',
            'Se sente dor pélvica frequente sem causa conhecida.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Manter os exames preventivos em dia (conforme orientação da UBS).',
            'Usar preservativo nas relações sexuais.',
            'Tomar a vacina contra HPV (quando indicada).',
            'Evitar o tabagismo.',
            'Procurar a UBS regularmente para acompanhamento.',
            'Manter um estilo de vida saudável.',
          ],
        ),
      ],
      references: [
        'https://www.inca.gov.br/publicacoes/livros/diretrizes-brasileiras-para-o-rastreamento-do-cancer-do-colo-do-utero',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=57',
      ],
    );
  }
}
