# Decisões — PRG Mobile

Registro das decisões técnicas do projeto. Cada decisão diz **o que** foi
decidido e **por quê**, para que quem chegar depois não precise perguntar.

Para mudar uma decisão, abra um PR alterando este arquivo junto com o código.

---

## Arquitetura: MVVM + Riverpod

**Data:** 2026-10-09

Seguimos o guia de arquitetura da área de Mobile da Asimov Jr.
([onboarding-mobile-asimovjr](https://github.com/Lhferraaz/onboarding-mobile-asimovjr/tree/main/docs)).
Esse guia tem prioridade sobre qualquer outra convenção. O resumo está em
[architecture.md](architecture.md).

O `main.dart` só inicia o app dentro do `ProviderScope`. O `app.dart` junta o
tema e o router.

## Navegação: `go_router` com `StatefulShellRoute`

**Data:** 2026-10-09

As 5 abas da barra inferior (Início, Matérias, Carreira, Mapa, Menu) são
`StatefulShellBranch` de um `StatefulShellRoute.indexedStack`.

**Por quê:**

- cada aba tem a própria pilha de telas: abrir Matérias › Cálculo II, trocar de
  aba e voltar mantém o Cálculo II aberto;
- a aba ativa é decidida pela rota. Navegar com `context.go` para uma tela de
  outra aba já atualiza a barra, sem nenhuma tela precisar avisar a barra.

O router fica em um `Provider` do Riverpod (`routerProvider`).

## Barra inferior sem estado e com os destinos fixos

**Data:** 2026-10-09

A `UnifeiBottomNavBar` é um `StatelessWidget`: recebe `currentIndex` e avisa o
toque por `onTap`. Quem guarda o índice é o router, repassado pela `MainShell`.

**Por quê:** se a barra guardasse o próprio índice, ele existiria em dois
lugares (barra e router) e sairia de sincronia sempre que uma tela navegasse
para outra aba sem passar pela barra. O `NavigationBar` do Flutter segue o
mesmo modelo.

Os 5 destinos ficam dentro da própria barra, porque o app só tem uma barra
inferior e ela sempre mostra os mesmos destinos. A ordem dos destinos precisa
ser a mesma das abas no `router.dart`.

## Tokens de design em `ui/core/shared/themes/`

**Data:** 2026-10-09

| Arquivo | Conteúdo |
| --- | --- |
| `unifei_colors.dart` | `UnifeiColors` e `UnifeiSubjectColors` (pares de cor por matéria) |
| `unifei_fonts.dart` | `UnifeiFonts` |
| `unifei_spaces.dart` | `UnifeiSpaces` e `UnifeiRadius` |
| `unifei_theme.dart` | `UnifeiTheme.light` (o `ThemeData`) e `UnifeiShadows` |

A fonte da verdade é a página **"Prototipagem Oficial"** do Figma.

- A tipografia segue o conjunto **"Tipografia v2"**. Os estilos "PRG/UI" que
  ainda aparecem nas telas também estão em `UnifeiFonts`. Os estilos em
  Manrope/Inter e as cores "Cor dominante" (`#0E6CC2`) e "Core Destaque"
  (`#7C3AED`) são de uma versão antiga do Figma e não são usados.
- Os estilos de texto não definem cor; a cor entra com `copyWith`.
- A variável `radius/card` do Figma vale 14, mas as telas oficiais usam 20.
  O código segue as telas (`UnifeiRadius.card = 20`).

## Fonte pelo `google_fonts`

**Data:** 2026-10-09

A Source Sans 3 vem do pacote `google_fonts`, não de arquivos em `assets/`.

**Consequência:** na primeira vez que o app abre, a fonte é baixada da
internet. Sem conexão, aparece a fonte padrão até o download acontecer. Se isso
virar problema, os arquivos da fonte podem ser colocados nos assets e o pacote
passa a usá-los sem baixar nada.

## Ícones Phosphor

**Data:** 2026-10-09

Os ícones do Figma são do Phosphor, estilo Regular, pelo pacote
`phosphor_flutter` (`PhosphorIconsRegular`). O ícone de Matérias é próprio do
Figma; o app usa o `bookOpen` no lugar.

## Galeria de widgets

**Data:** 2026-10-09

`lib/main_gallery.dart` é um ponto de entrada separado que abre a
`GalleryScreen`, uma tela para testar os widgets compartilhados isoladamente.
Por ser outro `main`, ela não entra no app de produção.

## Convenções do repositório

**Data:** 2026-10-09

- Nome do pacote: `unifei_mobile`.
- Branches: `feature/`, `fix/`, `chore/` + descrição curta.
- Comentários de código em português, descrevendo o código.
