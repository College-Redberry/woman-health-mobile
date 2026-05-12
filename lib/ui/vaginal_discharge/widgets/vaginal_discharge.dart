import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class VaginalDischargePage extends StatelessWidget {
  const VaginalDischargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      intro: [
        'Corrimentos vaginais, o que você deve saber sobre?',
        'Durante o ciclo da mulher, o muco pode apresentar características diferentes, mas ainda assim, ser considerado normal.',
      ],
      sections: [
        HealthSection(
          title: 'O que é normal?',
          bullets: [
            'O muco fisiológico, normalmente é transparente ou claro, sem odor e não causa coceira.',
            'Durante o período fértil, é normal também o muco se tornar mais elástico e lubrificante, semelhante a clara de ovo (transparente, escorregadio e fluido), podendo puxá-lo em fio. Produz na vulva uma sensação de umidade e lubrificação.',
          ],
        ),
        HealthSection(
          title: 'O que não é normal e você deve prestar atenção?',
          paragraphs: [
            'Existem algumas situações em que o muco vaginal torna-se diferente e, nesses casos, é necessário procurar sua UBS o mais rápido possível. Quando o corrimento apresentar características como:',
          ],
          bullets: [
            'Coloração branca, aspecto grumoso, acompanhada de coceira intensa, ardor; ou',
            'Coloração amarelada ou esverdeada, com aspecto bolhoso e odor forte; ou',
            'Coloração acinzentada, odor fétido e que piora após relação sexual; ou',
            'Corrimento acompanhado de dor pélvica (dor na região inferior do abdome), associado a dor ou ardência ao urinar e/ou sangramento após a relação sexual.',
          ],
        ),
        HealthSection(
          title: 'Procure a UBS sempre que houver:',
          bullets: [
            'Corrimento com odor forte ou desagradável;',
            'Corrimento amarelado, esverdeado ou acinzentado;',
            'Coceira, ardor, dor durante ou após a relação sexual ou ao urinar.',
          ],
        ),
        HealthSection(
          title: 'IMPORTANTE',
          paragraphs: [
            'Gestante com qualquer tipo de alteração precisa de avaliação mesmo que leve.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Mantenha a higiene íntima com água e sabão neutro, sem duchas internas.',
            'Evite roupas muito apertadas e calcinhas com tecidos sintéticos.',
            'Prefira dormir sem calcinha para ventilação da região.',
            'Evite uso de protetores diários contínuos.',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para confirmação e tratamento adequado.',
      references: [
        'https://bvsms.saude.gov.br/bvs/publicacoes/protocolos_atencao_basica_saude_mulheres.pdf',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=9',
      ],
    );
  }
}
