import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      title: 'Saúde da Mulher',
      intro: [
        'Bem-vinda! Este aplicativo reúne informações sobre as queixas ginecológicas e obstétricas mais comuns, com orientações de cuidado em casa e sinais de quando procurar a Unidade Básica de Saúde (UBS).',
      ],
      sections: [
        HealthSection(
          title: 'Como usar o app',
          bullets: [
            'Escolha um tema no menu para ler sobre sintomas, sinais de alerta e cuidados em casa.',
            'Registre seus sintomas e ciclos no aplicativo para acompanhar um padrão.',
            'Leve esses registros para sua consulta na UBS sempre que precisar de avaliação.',
          ],
        ),
        HealthSection(
          title: 'Temas disponíveis',
          bullets: [
            'Corrimento vaginal',
            'Cólica',
            'Atraso menstrual',
            'Sangramento fora do período menstrual',
            'Dor ou ardor ao urinar',
            'Conheça seu ciclo menstrual',
            'TPM e alterações emocionais',
            'Prevenção e rastreio do câncer de colo do útero',
            'Prevenção e rastreio do câncer de mama',
            'Violência contra a mulher',
            'Climatério e menopausa',
            'Autocuidado e hábitos saudáveis',
          ],
        ),
      ],
      warning:
          'Essas informações não substituem avaliação médica. Procure sempre a UBS para confirmação e acompanhamento.',
    );
  }
}
