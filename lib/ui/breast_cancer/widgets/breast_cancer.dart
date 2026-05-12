import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class BreastCancerPage extends StatelessWidget {
  const BreastCancerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      sections: [
        HealthSection(
          title: 'O que é normal:',
          paragraphs: [
            'Realizar exames de rotina e observar as mamas faz parte do autocuidado e ajuda na detecção precoce.',
          ],
        ),
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Se notar caroço (nódulo) na mama ou na axila.',
            'Se perceber secreção pelo mamilo.',
            'Se houver retração da pele ou do mamilo.',
            'Se perceber pele com aspecto de casca de laranja.',
            'Se observar vermelhidão, inchaço ou mudança no formato da mama.',
            'Se nunca realizou mamografia (a partir dos 40 anos ou antes, se indicado).',
            'Se houver histórico familiar de câncer de mama.',
            'Se dor em uma ou ambas mamas.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Observar suas mamas mensalmente, prestando atenção às mudanças.',
            'Agendar mamografia conforme orientação da UBS.',
            'Evitar tabagismo, excesso de álcool e sedentarismo.',
            'Manter alimentação saudável, rica em frutas, verduras e fibras.',
            'Frequentar a UBS regularmente para acompanhamento.',
            'Realizar atividades físicas regularmente.',
          ],
        ),
      ],
      references: [
        'https://www.inca.gov.br/publicacoes/livros/diretrizes-para-deteccao-precoce-do-cancer-de-mama-no-brasil',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=65',
      ],
    );
  }
}
