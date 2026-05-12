import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class PmsAndEmotionsPage extends StatelessWidget {
  const PmsAndEmotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      intro: [
        'Humor: Antes da menstruação, ocorre uma queda do hormônio estrogênio. Essa mudança pode influenciar substâncias do cérebro, como a serotonina e a dopamina, que estão relacionadas ao bem-estar e às emoções.',
        'Por isso, algumas mulheres podem sentir irritação, tristeza, sensibilidade maior ou mudanças de humor nesse período. Mas é importante lembrar que nem todas vão sentir os mesmos sintomas, e eles nem sempre acontecem apenas por causa da menstruação. Fatores como estresse, rotina, alimentação, sono e situações pessoais também influenciam bastante.',
        'Manter uma alimentação equilibrada, praticar atividade física, dormir bem e evitar excesso de álcool e cigarro são atitudes que ajudam a diminuir esses sintomas e contribuem para o seu bem-estar geral.',
      ],
      sections: [
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Fazer pequenas refeições equilibradas e praticar exercícios leves.',
            'Reduzir o consumo de álcool e cafeína.',
            'Reservar momentos de descanso e lazer.',
            'Buscar apoio psicológico se sentir sobrecarga emocional.',
          ],
        ),
      ],
      references: [
        'https://www.gov.br/saude/pt-br/centrais-de-conteudo/publicacoes/cartilhas/2025/programa-dignidade-menstrual-novembro-2025.pdf',
      ],
    );
  }
}
