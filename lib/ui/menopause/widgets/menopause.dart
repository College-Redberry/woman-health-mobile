import 'package:flutter/material.dart';
import 'package:woman_health/ui/core/widgets/health_content.dart';

class MenopausePage extends StatelessWidget {
  const MenopausePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthContent(
      title: 'Climatério e Menopausa',
      intro: [
        'O climatério é a fase da vida da mulher em que o corpo está passando da etapa reprodutiva (em que pode engravidar) para a etapa não reprodutiva. Essa transição costuma acontecer, em geral, entre os 40 e 65 anos de idade.',
        'A menopausa é um marco importante dentro do climatério. Ela significa a parada definitiva da menstruação. O diagnóstico só pode ser confirmado depois que a mulher fica 12 meses seguidos sem menstruar, sem outra causa para isso. Geralmente, a menopausa acontece entre os 48 e 50 anos de idade.',
      ],
      sections: [
        HealthSection(
          title: 'Sintomas comuns:',
          paragraphs: [
            'Ondas de calor (fogachos), suores noturnos, alterações do sono, irritabilidade, ansiedade, oscilações de humor, irregularidade menstrual (na transição), diminuição da libido, ressecamento vaginal, dor na relação sexual, ardor ou coceira vaginal, urgência urinária, infecções urinárias recorrentes, ganho de peso, diminuição da massa óssea (osteopenia/osteoporose).',
          ],
        ),
        HealthSection(
          title: 'Quando procurar a UBS:',
          bullets: [
            'Ao perceber os primeiros sinais e sintomas; ou',
            'Sintomas intensos que afetam o sono ou a qualidade de vida;',
            'Sangramento após 1 ano sem menstruar;',
            'Dor durante relações sexuais;',
            'Qualquer sintoma citado acima; ou',
            'Quando estiver na faixa etária indicada.',
          ],
        ),
        HealthSection(
          title: 'Em caso de fogachos e suores noturnos:',
          bullets: [
            'Dormir em ambiente bem ventilado;',
            'Usar roupas em camadas que possam ser facilmente retiradas se perceber a chegada dos sintomas;',
            'Usar tecidos que deixem a pele "respirar";',
            'Beber um copo de água ou suco quando perceber a chegada deles;',
            'Não fumar, evitar consumo de bebidas alcoólicas e de cafeína;',
            'Ter um diário para anotar os momentos em que o fogacho se inicia e, desse modo, tentar identificar situações-gatilho e evitá-las. (Você pode usar este aplicativo para isso.)',
            'Praticar atividade física;',
            'Perder peso, caso haja excesso de peso;',
            'Respirar lenta e profundamente por alguns minutos.',
          ],
        ),
        HealthSection(
          title: 'Em caso de problemas para dormir:',
          bullets: [
            'Se os suores noturnos/fogachos estiverem interrompendo o sono, observar as orientações indicadas no item anterior.',
            'Se há necessidade de se levantar muitas vezes à noite para ir ao banheiro, diminuir a tomada de líquidos antes da hora de dormir, reservando o copo de água para o controle dos fogachos.',
            'Praticar atividades físicas na maior parte dos dias, mas nunca a partir de três horas antes de ir dormir.',
            'Deitar-se e levantar-se sempre nos mesmos horários diariamente, mesmo nos fins de semana, e evitar tirar cochilos, principalmente depois do almoço e ao longo da tarde.',
            'Escolher uma atividade prazerosa diária para a hora de se deitar, como ler livro ou tomar banho morno.',
            'Assegurar que a cama e o quarto de dormir estejam confortáveis.',
            'Não fazer nenhuma refeição pesada antes de se deitar e evitar bebidas à base de cafeína no fim da tarde.',
            'Se permanecer acordada por mais de 15 minutos após apagar as luzes, levantar-se e permanecer fora da cama até perceber que irá adormecer.',
            'Experimentar uma respiração lenta e profunda por alguns minutos.',
          ],
        ),
        HealthSection(
          title: 'De maneira geral, o que você também pode fazer é:',
          bullets: [
            'Manter uma alimentação saudável e hidratação adequada;',
            'Praticar atividade física regularmente;',
            'Evitar cigarro e excesso de álcool;',
            'Buscar orientação sobre terapia hormonal, se necessário;',
            'Procurar adquirir mais informações sobre esse processo natural do corpo da mulher e sua sexualidade nessa fase;',
            'Considerar o uso de lubrificantes vaginais durante a relação sexual.',
          ],
        ),
      ],
      references: [
        'https://bvsms.saude.gov.br/bvs/publicacoes/protocolos_atencao_basica_saude_mulheres.pdf',
        'https://wiki.smsbrusque.sc.gov.br/images/c/cb/Ebook_Saude_da_Mulher_compressed_%281%29.pdf#page=71',
      ],
    );
  }
}
