import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/unifei_colors.dart';
import '../themes/unifei_fonts.dart';
import '../themes/unifei_spaces.dart';

/// Destino exibido na [UnifeiBottomNavBar].
class _Destination {
  const _Destination({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// Barra de navegação inferior flutuante do Figma (`Navigation/Bottom`), com
/// os cinco destinos do app: Início, Matérias, Carreira, Mapa e Menu.
///
/// Destaca o destino ativo com um fundo suave e fica a [margin] de distância
/// das laterais e da base da tela. Em conjunto com
/// `Scaffold(extendBody: true)`, o conteúdo rola por trás da barra.
///
/// A barra não guarda a aba ativa: recebe [currentIndex] e repassa o toque
/// por [onTap]. O índice fica com a navegação (`MainShell`).
class UnifeiBottomNavBar extends StatelessWidget {
  const UnifeiBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.margin = const EdgeInsets.fromLTRB(
      UnifeiSpaces.bottomNavMargin,
      0,
      UnifeiSpaces.bottomNavMargin,
      UnifeiSpaces.bottomNavMargin,
    ),
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final EdgeInsetsGeometry margin;

  // A ordem acompanha a das abas (branches) em `routing/router.dart`. Ícones
  // Phosphor Regular; Matérias usa o `bookOpen` no lugar do ícone próprio do
  // Figma.
  static const _destinations = [
    _Destination(icon: PhosphorIconsRegular.house, label: 'Início'),
    _Destination(icon: PhosphorIconsRegular.bookOpen, label: 'Matérias'),
    _Destination(icon: PhosphorIconsRegular.briefcase, label: 'Carreira'),
    _Destination(icon: PhosphorIconsRegular.mapTrifold, label: 'Mapa'),
    _Destination(icon: PhosphorIconsRegular.list, label: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        height: UnifeiSpaces.bottomNavHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: UnifeiSpaces.sm,
        ),
        decoration: BoxDecoration(
          color: UnifeiColors.surface,
          borderRadius: BorderRadius.circular(UnifeiRadius.card),
          border: Border.all(color: UnifeiColors.border),
        ),
        // Os itens dividem a largura igualmente (70 px cada na largura de 402
        // do Figma), sem tamanho fixo, para não estourar em telas estreitas.
        child: Row(
          children: [
            for (var i = 0; i < _destinations.length; i++)
              Expanded(
                child: _NavItem(
                  destination: _destinations[i],
                  active: i == currentIndex,
                  onTap: () => onTap(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// `Navigation/Bottom Item`: ícone sobre o rótulo, com 56 px de altura e 1/5
/// da largura da barra (70 px na largura do Figma).
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.active,
    required this.onTap,
  });

  final _Destination destination;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? UnifeiColors.primary : UnifeiColors.textSecondary;

    return Semantics(
      button: true,
      selected: active,
      child: Material(
        color: active ? UnifeiColors.blueLight : Colors.transparent,
        borderRadius: BorderRadius.circular(UnifeiRadius.button),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(UnifeiRadius.button),
          child: SizedBox(
            height: 56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(destination.icon, size: 22, color: color),
                const SizedBox(height: UnifeiSpaces.xxs),
                Text(
                  destination.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: UnifeiFonts.navLabel.copyWith(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
