import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/core/shared/widgets/main_shell.dart';
import '../ui/core/shared/widgets/placeholder_screen.dart';
import '../ui/home/screens/home_screen.dart';
import 'routes.dart';

// =============================================================================
// COMO ADICIONAR UMA TELA
// =============================================================================
//
// 1. A tela fica em `ui/<feature>/screens/`.
// 2. O caminho entra em `routes.dart`.
// 3. A rota é registrada aqui:
//
//    - Tela COM a barra inferior (dentro de uma aba): a rota vai no
//      `routes:` da aba. O caminho é relativo ao da aba e não começa com
//      "/". Exemplo real: a matéria, dentro de "Matérias".
//
//        GoRoute(
//          path: 'avisos', // vira /materias/avisos
//          builder: (context, state) => const AvisosScreen(),
//        ),
//
//    - Tela SEM a barra inferior (onboarding, login, telas em tela cheia):
//      a rota vai na lista de fora, ao lado do `StatefulShellRoute`. O
//      caminho começa com "/".
//
//        GoRoute(
//          path: Routes.onboarding,
//          builder: (context, state) => const OnboardingScreen(),
//        ),
//
// 4. A navegação usa `context.go(Routes.suaRota)`, ou `context.push(...)`
//    quando o botão voltar deve retornar para a tela anterior.
// =============================================================================

/// Router do app, disponibilizado pelo Riverpod.
///
/// O `StatefulShellRoute` cria as 5 abas da barra inferior. Cada aba
/// (`StatefulShellBranch`) tem a própria pilha de telas: entrar em Matérias ›
/// Cálculo II, trocar de aba e voltar mantém o Cálculo II aberto.
final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        // A ordem das abas acompanha a dos itens da barra em `MainShell`.
        branches: [
          // Aba 0: Início
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          // Aba 1: Matérias
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.materias,
                builder: (context, state) =>
                    const PlaceholderScreen(title: 'Matérias'),
                routes: [
                  // Exemplo de tela dentro de uma aba, com parâmetro no
                  // caminho: /materias/calculo-2. A barra continua com
                  // "Matérias" ativo.
                  GoRoute(
                    path: ':id',
                    builder: (context, state) => PlaceholderScreen(
                      title: 'Matéria ${state.pathParameters['id']}',
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Aba 2: Carreira
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.carreira,
                builder: (context, state) =>
                    const PlaceholderScreen(title: 'Carreira'),
              ),
            ],
          ),

          // Aba 3: Mapa
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.mapa,
                builder: (context, state) =>
                    const PlaceholderScreen(title: 'Mapa'),
              ),
            ],
          ),

          // Aba 4: Menu
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.menu,
                builder: (context, state) =>
                    const PlaceholderScreen(title: 'Menu'),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});
