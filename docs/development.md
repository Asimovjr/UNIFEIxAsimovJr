# Guia de Desenvolvimento — PRG Mobile

> Placeholder. Preencher conforme as decisões do time.

## Pré-requisitos

- Flutter SDK (canal `stable`)
- Dart SDK (incluso no Flutter)
- Android Studio / Xcode para emuladores

## Setup

```bash
flutter pub get
```

## Rodar o app

```bash
flutter run
```

## Qualidade

```bash
dart format .
flutter analyze
flutter test
```

Os mesmos comandos rodam no CI (`.github/workflows/ci.yml`).

## Convenções

- Estrutura de pastas: ver [architecture.md](architecture.md)
- Nomes de arquivos em `snake_case.dart`
- Uma feature por pasta em `lib/ui/<feature>/`

## Git

- Branch base: `main`
- Branches de trabalho: `feat/`, `fix/`, `chore/` + descrição curta
- Commits: (padrão a definir — ex.: Conventional Commits)
- Todo PR usa o template em `.github/PULL_REQUEST_TEMPLATE.md`

## A definir

- [ ] Ambientes (dev / staging / prod)
- [ ] Variáveis de ambiente e secrets
- [ ] Processo de release / build
