# Setup do projeto Flutter

Este guia explica como preparar o ambiente e rodar o projeto `woman_health` localmente.

## 1. Requisitos

Antes de rodar o app, instale:

- Flutter SDK
- Git
- Android Studio, caso queira rodar no Android
- Chrome, caso queira rodar no navegador
- Visual Studio Code ou Android Studio para editar o projeto

No Windows, depois de instalar o Flutter, adicione a pasta `bin` do Flutter ao `PATH`.

Exemplo:

```powershell
C:\src\flutter\bin
```

Feche e abra o terminal novamente depois de alterar o `PATH`.

## 2. Verificar o ambiente Flutter

Na raiz do projeto, rode:

```powershell
flutter doctor
```

Esse comando mostra se o Flutter está instalado corretamente e se falta algum componente.

Para corrigir licenças do Android SDK, rode:

```powershell
flutter doctor --android-licenses
```

Aceite as licenças quando solicitado.

Depois rode novamente:

```powershell
flutter doctor
```

O ideal é que os itens necessários apareçam sem erros.

## 3. Entrar na pasta do projeto

Abra o terminal na pasta base do projeto:

```powershell
cd C:\xampp\htdocs\woman-health-mobile
```

Confirme que você está na pasta correta:

```powershell
dir
```

Você deve ver arquivos como:

- `pubspec.yaml`
- `lib`
- `android`
- `web`

## 4. Baixar as dependências

Rode:

```powershell
flutter pub get
```

Esse comando baixa os pacotes usados pelo projeto, como `go_router`, `crypto` e outros definidos no `pubspec.yaml`.

## 5. Listar dispositivos disponíveis

Para ver onde o app pode rodar, use:

```powershell
flutter devices
```

Exemplos de dispositivos possíveis:

- Chrome
- Android emulator
- Celular Android conectado por USB
- Windows desktop

## 6. Rodar no Chrome

Para rodar o app no navegador:

```powershell
flutter run -d chrome
```

O Flutter abrirá o Chrome com o app em modo desenvolvimento.

Durante a execução, alguns atalhos úteis aparecem no terminal:

- `r`: hot reload
- `R`: hot restart
- `q`: parar o app

## 7. Rodar em Android

Abra um emulador pelo Android Studio ou conecte um celular Android com depuração USB ativada.

Depois confirme se o dispositivo aparece:

```powershell
flutter devices
```

Rode o app no Android:

```powershell
flutter run
```

Se houver mais de um dispositivo, informe o id:

```powershell
flutter run -d ID_DO_DISPOSITIVO
```

O id aparece na saída do comando `flutter devices`.

## 8. Rodar no Windows desktop

Se o suporte a desktop estiver habilitado no seu ambiente, rode:

```powershell
flutter run -d windows
```

Se o Flutter informar que o suporte a Windows desktop não está habilitado, rode:

```powershell
flutter config --enable-windows-desktop
```

Depois tente novamente:

```powershell
flutter run -d windows
```

## 9. Analisar o código

Antes de entregar alterações, rode:

```powershell
dart analyze lib
```

Esse comando analisa os arquivos da pasta `lib` e aponta erros ou avisos importantes.

Também é possível rodar:

```powershell
flutter analyze
```

Observação: se existir algum teste antigo ou arquivo fora de `lib` com erro, `flutter analyze` pode falhar mesmo que o app compile.

## 10. Build para web

Para gerar uma versão web de produção:

```powershell
flutter build web
```

O resultado será criado em:

```powershell
build\web
```

## 11. Limpar build e reinstalar dependências

Se o projeto ficar com erro estranho de cache, rode:

```powershell
flutter clean
flutter pub get
```

Depois execute novamente:

```powershell
flutter run -d chrome
```

## 12. Problemas comuns

### Flutter não é reconhecido

Verifique se o caminho do Flutter foi adicionado ao `PATH`.

Depois feche e abra o terminal novamente.

### Android SDK não encontrado

Abra o Android Studio e instale:

- Android SDK
- Android SDK Platform-Tools
- Android SDK Build-Tools
- Android Emulator

Depois rode:

```powershell
flutter doctor
```

### Licenças Android pendentes

Rode:

```powershell
flutter doctor --android-licenses
```

### Nenhum dispositivo aparece

Rode:

```powershell
flutter devices
```

Se quiser rodar no navegador, confirme que o Chrome está instalado.

Se quiser rodar no Android, abra um emulador ou conecte um celular com depuração USB ativada.

## 13. Fluxo recomendado para desenvolvimento

1. Entrar na pasta do projeto.
2. Rodar `flutter pub get`.
3. Rodar `dart analyze lib`.
4. Rodar `flutter run -d chrome`.
5. Fazer alterações no código.
6. Usar hot reload com `r`.
7. Antes de finalizar, rodar novamente `dart analyze lib`.
