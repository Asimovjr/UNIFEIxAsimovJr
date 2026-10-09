# AGENTS.md — PRG Mobile

Instruções para agentes de IA (Claude Code, Copilot, Cursor, Codex etc.) que
trabalham neste repositório. Valem também para pessoas: são as mesmas regras do
time.

## O projeto

App institucional da PRG/UNIFEI, desenvolvido pela Asimov Jr.

- Flutter **3.41.7** / Dart 3.11.5. Não use nem sugira outra versão: o
  `phosphor_flutter` não compila em versões mais novas (ver `docs/decisions.md`).
- Pacote Dart: `unifei_mobile`.
- Estado e injeção de dependências: Riverpod (`flutter_riverpod`).
- Navegação: `go_router`.
- Fonte: Source Sans 3 via `google_fonts`. Ícones: Phosphor Regular via
  `phosphor_flutter`.
- Design: página "Prototipagem Oficial" do Figma.

## Antes de começar

Leia, nesta ordem de prioridade:

1. O guia de arquitetura da área:
   https://github.com/Lhferraaz/onboarding-mobile-asimovjr/tree/main/docs
   (`01-arquitetura.md` e `02-estrutura-de-projeto.md`). **Ele prevalece sobre
   qualquer outra convenção**, inclusive as suas.
2. `docs/decisions.md`: decisões já tomadas e o motivo de cada uma. Não reverta
   uma decisão registrada ali sem pedir.
3. `docs/development.md`: onde fica cada coisa e como adicionar uma tela.

## Comandos

```bash
flutter pub get
flutter run                          # app
flutter run -t lib/main_gallery.dart # galeria de widgets
dart format .
flutter analyze
flutter test
```

O CI roda `dart format --set-exit-if-changed`, `flutter analyze` e
`flutter test`. **Antes de dar uma tarefa como concluída, rode os três e
confirme que passam.** O `flutter analyze` precisa terminar sem nenhum aviso.

## Arquitetura (MVVM + Riverpod)

```text
Screen → ViewModel → Repository → Service → Firebase / API / SDK
```

- A **Screen** só monta a interface e repassa ações para o ViewModel. Nunca
  acessa Repository, Service, Firebase ou API diretamente.
- O **ViewModel** controla o estado da tela e chama Repositories.
- O **Repository** sabe *o que* fazer com os dados; o **Service** sabe *como*
  falar com a fonte.
- Os **Models** representam dados e não dependem da interface.
- Não crie camadas, classes ou abstrações sem uma responsabilidade real que as
  justifique.

### Onde colocar cada arquivo

| Se o código... | Vai em |
| --- | --- |
| É uma tela completa | `lib/ui/<feature>/screens/` |
| Controla o estado de uma feature | `lib/ui/<feature>/view_models/` |
| É um widget usado só por uma feature | `lib/ui/<feature>/widgets/` |
| É um widget usado por mais de uma feature | `lib/ui/core/shared/widgets/` |
| Define cor, fonte, espaçamento ou tema | `lib/ui/core/shared/themes/` |
| Representa dados | `lib/data/models/` |
| Abstrai o acesso a dados | `lib/data/repositories/` |
| Fala com Firebase, API ou SDK | `lib/data/services/` |
| Define rotas | `lib/routing/` |
| Configuração global | `lib/config/` |
| Auxiliar genérico de verdade | `lib/utils/` |

Um widget só vai para `shared/` quando já é reutilizado de fato, não "porque
talvez seja".

## Interface

### Tokens de design

Use sempre os tokens de `lib/ui/core/shared/themes/`:

- `UnifeiColors` (cores) e `UnifeiSubjectColors` (cor por matéria);
- `UnifeiFonts` (estilos da "Tipografia v2" do Figma);
- `UnifeiSpaces` (espaçamento) e `UnifeiRadius` (arredondamento);
- `UnifeiShadows` (sombras) e `UnifeiTheme.light` (o `ThemeData`).

**Nunca** use valores soltos como `Color(0xFF...)`, `Colors.blue`,
`fontSize: 14` ou `EdgeInsets.all(13)` dentro de telas e widgets. Se o Figma
usa um valor que ainda não existe nos tokens, adicione-o no arquivo de tema
certo e avise na resposta.

Os estilos de texto não têm cor; aplique com `copyWith`:

```dart
Text('Avisos', style: UnifeiFonts.sectionTitle.copyWith(color: UnifeiColors.textPrimary))
```

### Ícones

Use `PhosphorIconsRegular` (`phosphor_flutter`). Não use `Icons.*` do Material
em telas do app.

### Widgets compartilhados

Todo widget novo em `lib/ui/core/shared/widgets/` ganha uma seção em
`lib/gallery_screen.dart`, para poder ser testado isoladamente na galeria.

## Navegação

- Os caminhos ficam em `Routes` (`lib/routing/routes.dart`). Navegue sempre com
  as constantes (`context.go(Routes.materias)`), nunca com o texto do caminho.
- As rotas são registradas em `lib/routing/router.dart`. O topo do arquivo tem
  o passo a passo para adicionar uma tela, com e sem a barra inferior.
- A `UnifeiBottomNavBar` não guarda estado: a aba ativa vem do router. Não
  transforme a barra em `StatefulWidget` nem guarde o índice da aba em outro
  lugar.
- A ordem dos destinos da barra precisa ser a mesma das abas no `router.dart`.

## Testes

### Princípio

Um teste só existe se ele **falha quando o comportamento quebra**. Para cada
teste que você criar, escreva na resposta, em uma frase, **que bug ele pega**.
Se não conseguir dizer, não crie o teste.

### O que testar

Obrigatório:

- **ViewModels:** mudanças de estado (carregando, dados, erro) e ações, com
  Repositories falsos via `overrides` do `ProviderScope`.
- **Correção de bug:** um teste que reproduz o bug. Ele deve falhar antes da
  correção e passar depois.

Bem-vindo, mas não obrigatório por enquanto:

- **Repositories:** conversão de dados e regras, com Service falso.
- **`lib/utils/`:** funções puras, com vários casos de entrada e saída.
- **Widgets compartilhados:** o que o widget promete (estados, callbacks, não
  estourar em tela estreita). Exemplo: `test/ui/unifei_bottom_nav_bar_test.dart`.

### O que não testar

- Constantes de tema (`expect(UnifeiColors.primary, Color(0xFF003A70))`).
- Telas que só exibem texto, sem lógica ("a tela mostra o texto X"). O layout
  das telas ainda muda a cada rodada do Figma.
- Comportamento do Flutter ou de pacotes (o `Text` renderiza, o `go_router`
  navega).
- Models sem lógica e métodos privados.
- Golden tests (comparação de imagem).

### Regras

1. Testes são escritos **no mesmo PR** do código que testam.
2. **Fakes escritos à mão** em `testing/fakes/`, um por Repository ou Service,
   reutilizados por todos os testes. Não adicione `mockito` nem `mocktail`.
3. A pasta `test/` espelha a `lib/`
   (ex.: `test/ui/home/view_models/home_view_model_test.dart`).
4. Nomes de teste em português, descrevendo o comportamento:
   `'mostra erro quando o repositório falha'`.
5. Um comportamento por teste. Sem `sleep`, sem rede, sem depender da ordem
   dos testes.
6. Não gere testes em lote. Poucos testes que pegam bugs valem mais que muitos
   que só repetem o código.
7. **Nunca** altere ou apague um teste existente só para fazê-lo passar. Se um
   teste quebrou, descubra se o bug está no código ou no teste e explique.
8. Antes de entregar, quebre de propósito o comportamento testado e confirme
   que o teste falha.

## Código

- **Comentários em português**, descrevendo o que o código faz e por quê.
  Comentários não conversam com o leitor nem registram recados ("Atenção...",
  "Mantivemos...", "TODO: fulano ver isso"). Observações para quem pediu a
  tarefa vão na resposta, não no código.
- Nomes de arquivo em `snake_case.dart`.
- Prefira `const` sempre que possível (o lint cobra).
- Sem `print`; o lint `avoid_print` está ativo.

## O que não fazer sem pedir antes

- Adicionar, remover ou atualizar dependências no `pubspec.yaml`.
- Mudar a versão do Flutter (do projeto ou do CI).
- Alterar `applicationId`, bundle ID ou arquivos nativos em `android/`, `ios/`,
  `linux/`, `macos/`, `windows/` e `web/`.
- Alterar o CI (`.github/workflows/`) ou o template de PR.
- Reverter algo registrado em `docs/decisions.md`.
- Mudanças fora do escopo da tarefa (refatorar, renomear, "melhorar" código que
  não foi pedido). Sugira na resposta e deixe a pessoa decidir.

## Git e PRs

- Branch base: `main`. Branches de trabalho: `feature/`, `fix/` ou `chore/` +
  descrição curta (ex.: `feature/tela-cardapio`).
- Todo PR segue `.github/PULL_REQUEST_TEMPLATE.md` e precisa do CI verde.
- Não faça commit, push ou abra PR sem a pessoa pedir.
