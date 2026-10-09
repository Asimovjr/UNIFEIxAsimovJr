# Guia de Desenvolvimento — PRG Mobile

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

## Galeria de widgets

Tela só de desenvolvimento para testar os widgets compartilhados isoladamente,
sem navegar pelo app. Não entra no app de produção.

```bash
flutter run -t lib/main_gallery.dart
```

Ao criar um widget em `ui/core/shared/widgets/`, adicione uma seção para ele em
`lib/gallery_screen.dart`.

## Qualidade

```bash
dart format .
flutter analyze
flutter test
```

Os mesmos comandos rodam no CI (`.github/workflows/ci.yml`). O PR só é
mergeado com o CI verde.

## Onde fica cada coisa

| O quê | Onde |
| --- | --- |
| Cores | `UnifeiColors` em `ui/core/shared/themes/unifei_colors.dart` |
| Tipografia | `UnifeiFonts` em `ui/core/shared/themes/unifei_fonts.dart` |
| Espaçamentos e arredondamentos | `UnifeiSpaces` e `UnifeiRadius` em `ui/core/shared/themes/unifei_spaces.dart` |
| Tema do Material e sombras | `UnifeiTheme` e `UnifeiShadows` em `ui/core/shared/themes/unifei_theme.dart` |
| Widgets usados por mais de uma feature | `ui/core/shared/widgets/` |
| Caminhos das rotas | `Routes` em `routing/routes.dart` |
| Registro das rotas | `routing/router.dart` |

Não use cores, tamanhos de fonte ou espaçamentos soltos (`Color(0xFF...)`,
`fontSize: 14`, `EdgeInsets.all(13)`). Se um valor do Figma ainda não existe nos
arquivos de tema, adicione lá primeiro.

### Tipografia

Os estilos seguem o conjunto **"Tipografia v2"** do Figma. Eles não definem cor:

```dart
Text(
  'Avisos',
  style: UnifeiFonts.sectionTitle.copyWith(color: UnifeiColors.textPrimary),
)
```

A fonte (Source Sans 3) vem do pacote `google_fonts`.

### Ícones

Os ícones são do [Phosphor](https://phosphoricons.com/), estilo **Regular**,
pelo pacote `phosphor_flutter`:

```dart
const Icon(PhosphorIconsRegular.house)
```

## Adicionar uma tela

1. Crie a tela em `lib/ui/<feature>/screens/`.
2. Adicione o caminho em `lib/routing/routes.dart`.
3. Registre a rota em `lib/routing/router.dart`:
   - **com a barra inferior** (dentro de uma aba): dentro do `routes:` da aba;
   - **sem a barra inferior** (onboarding, login, tela cheia): na lista de fora,
     ao lado do `StatefulShellRoute`.
4. Navegue com `context.go(Routes.suaRota)`, ou `context.push(...)` quando o
   botão voltar deve retornar para a tela anterior.

O topo do `router.dart` tem esse passo a passo com exemplos de código, e a rota
`/materias/:id` é um exemplo real de tela dentro de uma aba.

As abas que ainda não têm tela usam a `PlaceholderScreen`. Troque pela tela de
verdade quando ela existir.

## Convenções

- Estrutura de pastas: ver [architecture.md](architecture.md)
- Decisões já tomadas: ver [decisions.md](decisions.md)
- Nomes de arquivos em `snake_case.dart`
- Uma feature por pasta em `lib/ui/<feature>/`
- Comentários de código em português

## Git

- Branch base: `main`
- Branches de trabalho: `feature/`, `fix/`, `chore/` + descrição curta
  (ex.: `feature/tela-cardapio`)
- Commits: (padrão a definir — ex.: Conventional Commits)
- Todo PR usa o template em `.github/PULL_REQUEST_TEMPLATE.md`

## A definir

- [ ] Ambientes (dev / staging / prod)
- [ ] Variáveis de ambiente e secrets
- [ ] Processo de release / build
- [ ] `applicationId` / bundle ID definitivos (hoje `com.example.flutter_application_1`)
