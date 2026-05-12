# 🌸 App Saúde da Mulher

Este é um projeto de aplicação móvel desenvolvido em **Flutter** focado na literacia em saúde feminina. O objetivo é fornecer orientações claras sobre queixas ginecológicas e obstétricas comuns, ajudando a identificar quando é necessário procurar uma Unidade Básica de Saúde (UBS).

---

## 🏗️ Arquitetura (Official Flutter Case Study)

O projeto segue rigorosamente o padrão **MVVM (Model-View-ViewModel)** com o estilo de organização por **Camadas e Funcionalidades** sugerido no estudo de caso oficial da Google.


## 🛠️ Tecnologias e Padrões Utilizados

* **[go_router](https://pub.dev/packages/go_router):** Navegação declarativa com suporte a rotas nomeadas e parâmetros.
* **[result_dart](https://pub.dev/packages/result_dart):** Implementação do **Result Pattern** para um tratamento de erros seguro, evitando o uso excessivo de `try-catch`.
* **[crypto](https://pub.dev/packages/crypto):** Utilizado na camada de serviço para realizar o hashing de passwords (SHA-256) antes do envio para o repositório.
* **Vanilla DI:** Injeção de dependência feita manualmente via construtores e Scopes, sem necessidade de pacotes externos como `get_it`.

---

## 🚀 Como Executar o Projeto

### 1. Pré-requisitos
* Flutter SDK instalado (versão estável).
* Um emulador ou dispositivo físico configurado.

### 2. Configurar Dependências
No teu ficheiro `pubspec.yaml`, certifica-te de que tens as seguintes linhas:

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^13.0.0
  result_dart: ^1.1.0
  crypto: ^3.0.3