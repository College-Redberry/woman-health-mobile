import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class SelfCarePage extends StatelessWidget {
  const SelfCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      sections: [
        HealthSection(
          title: 'O que é normal:',
          paragraphs: [
            'Cuidar da saúde é um ato de amor-próprio e deve fazer parte do cotidiano.',
          ],
        ),
        HealthSection(
          title: 'O que você pode fazer em casa:',
          bullets: [
            'Ter rotina de sono regular e alimentação equilibrada.',
            'Praticar atividade física pelo menos 3x por semana.',
            'Fazer autoexame das mamas para conhecer seu próprio corpo e exames preventivos.',
            'Separar momentos de lazer e relaxamento.',
            'Evitar uso abusivo de álcool, cigarro e automedicação.',
          ],
        ),
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Para acompanhamento regular, vacinação, planejamento familiar, suporte emocional ou sempre que você precisar.',
          ],
        ),
      ],
    );
  }
}
