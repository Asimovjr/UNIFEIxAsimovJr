# PRG Mobile

Aplicativo institucional desenvolvido pela Asimov Jr. para a PRG/UNIFEI.

## Requisitos

- Flutter 3.41.7 (canal `stable`)
- Dart 3.11.5 (incluso no Flutter)
- SDK Dart exigido pelo projeto: `^3.11.5` (ver `pubspec.yaml`)
- Android Studio e/ou Xcode para emuladores

Versão do app: `1.0.0+1`

## Rodando o projeto

```bash
flutter pub get
flutter run
```

## Qualidade

```bash
dart format .
flutter analyze
flutter test
```

Os mesmos comandos rodam no CI (`.github/workflows/ci.yml`).

## Workflow

1. Pegue uma task no Jira
2. Crie uma branch a partir da `main`
3. Desenvolva
4. Abra um Draft PR se a tarefa for longa
5. Finalize a implementação
6. Solicite review
7. Merge após aprovação e CI

## Branches

```text
feature/PRG-23-cardapio
fix/PRG-31-home-overflow
refactor/PRG-42-navigation
```

## Estrutura

```text
lib/
├── ui/          # telas, view models e widgets, por feature
├── data/        # models, repositories e services
├── config/      # configurações e inicializações
├── routing/     # rotas e navegação
├── utils/       # helpers genéricos
└── main.dart
```

Detalhes em [docs/architecture.md](docs/architecture.md).

## Documentação

- [Arquitetura](docs/architecture.md)
- [Guia de desenvolvimento](docs/development.md)
