import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'unifei_bottom_nav_bar.dart';

/// Casca das telas principais: mostra a aba atual e a barra inferior.
///
/// É criada uma vez só pelo `StatefulShellRoute` em `routing/router.dart`.
/// As telas não sabem que a barra existe: quem diz qual aba está ativa é o
/// [navigationShell], então a barra sempre acompanha a navegação, inclusive
/// quando uma tela usa `context.go` para ir a outra aba.
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Deixa o conteúdo rolar por trás da barra flutuante.
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: UnifeiBottomNavBar(
          currentIndex: navigationShell.currentIndex,
          // Tocar na aba que já está ativa volta para a primeira tela dela.
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }
}
