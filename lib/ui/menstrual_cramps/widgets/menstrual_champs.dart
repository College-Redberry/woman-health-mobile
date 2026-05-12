import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class MenstrualCrampsPage extends StatelessWidget {
  const MenstrualCrampsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      title: 'Cólica',
      intro: [
        'É uma dor na parte de baixo da barriga (abaixo do umbigo), comum em mulheres. É muito comum em jovens e adolescentes logo após a primeira menstruação. Porém, se você sentir dor forte ou cólicas intensas nessa região, é importante procurar a sua UBS para avaliação.',
      ],
      sections: [
        HealthSection(
          title: 'Procure a UBS sempre que houver:',
          bullets: [
            'Febre; ou',
            'Se sentir dor muito forte; ou',
            'Em caso de sangramento intenso; ou',
            'Se houver suspeita ou confirmação de gravidez; ou',
            'Cólica intensa ou dor intensa à palpação; ou',
            'Se perceber manchas arroxeadas na pele.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          paragraphs: [
            'Se não houver nenhum sintoma citado anteriormente, você pode:',
          ],
          bullets: [
            'Fazer compressas de água morna na região inferior do abdômen.',
            'Praticar atividade física.',
            'Manter hidratação e alimentação saudável.',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para avaliação e conduta adequada.',
      references: [
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=9',
      ],
    );
  }
}
