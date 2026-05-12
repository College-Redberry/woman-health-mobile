import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class ViolenceAgainstWomenPage extends StatelessWidget {
  const ViolenceAgainstWomenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      title: 'Violência Contra a Mulher',
      intro: [
        'A violência contra a mulher é qualquer atitude ou comportamento motivado pelo fato de ela ser mulher que provoque morte, dor, sofrimento ou prejuízo físico, sexual ou emocional.',
        'Isso pode acontecer tanto em espaços públicos (como na rua ou no trabalho) quanto dentro de casa, no ambiente familiar ou em um relacionamento.',
      ],
      sections: [
        HealthSection(
          title: 'Quando procurar ajuda:',
          bullets: [
            'Se sentir medo, vergonha, culpa ou estiver sendo ameaçada.',
            'Se houver agressões físicas, sexuais ou controle de sua rotina.',
            'Se precisar de apoio para sair de uma relação abusiva.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer:',
          bullets: [
            'Buscar atendimento na UBS, CRAS, CREAS ou Delegacia da Mulher.',
            'Ligar para o 180 (Central de Atendimento à Mulher) – gratuito e sigiloso.',
            'Utilizar o Violentômetro para identificar sinais de abuso.',
            'Pedir ajuda a alguém de confiança e não se isolar.',
          ],
        ),
        HealthSection(
          title: 'Violentômetro – sinais de alerta',
          paragraphs: [
            'CUIDADO (a violência tende a aumentar): 1. Chantagear  2. Mentir/Enganar  3. Ignorar/Desprezar  4. Ciúmes excessivo  5. Ofender/Humilhar  6. Intimidar/Ameaçar  7. Proibir/Controlar.',
            'REAJA – denuncie e peça ajuda: 8. Destruir bens pessoais  9. Machucar e agredir  10. Empurrar  11. Golpear.',
            'ALERTA – sua vida está em PERIGO: 12. Chutar  13. Confinar/Prender  14. Ameaçar com armas  15. Ameaçar de morte  16. Abusar sexualmente  17. Espancar/Mutilar  18. Matar – feminicídio.',
            'Precisa de ajuda? Ligue 180.',
          ],
        ),
      ],
      references: [
        'Lei nº 11.340/2006 (Lei Maria da Penha): http://www.planalto.gov.br/ccivil_03/_ato2004-2006/2006/lei/l11340.htm',
        'https://www.gov.br/mulheres',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=85',
        'https://bvsms.saude.gov.br/bvs/publicacoes/protocolos_atencao_basica_saude_mulheres.pdf',
      ],
    );
  }
}
