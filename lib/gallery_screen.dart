import 'package:flutter/material.dart';

import 'ui/core/shared/themes/unifei_fonts.dart';
import 'ui/core/shared/themes/unifei_spaces.dart';
import 'ui/core/shared/themes/unifei_colors.dart';
import 'ui/core/shared/widgets/unifei_bottom_nav_bar.dart';

/// Tela de desenvolvimento para testar os widgets compartilhados isoladamente.
/// O ponto de entrada é o `lib/main_gallery.dart`.
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UnifeiColors.background,
      appBar: AppBar(title: const Text('Galeria')),
      body: ListView(
        padding: const EdgeInsets.all(UnifeiSpaces.screenGutter),
        children: const [
          _Section(
            title: 'Bottom navigation',
            description: 'Barra inferior flutuante, 5 destinos',
            children: [_BottomNavDemo()],
          ),
        ],
      ),
    );
  }
}

/// Mostra um widget e suas variações abaixo de um título.
class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.children,
    this.description,
  });

  final String title;
  final String? description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: UnifeiFonts.sectionTitle.copyWith(
            color: UnifeiColors.textPrimary,
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: UnifeiSpaces.xxs),
          Text(
            description!,
            style: UnifeiFonts.caption.copyWith(
              color: UnifeiColors.textSecondary,
            ),
          ),
        ],
        const SizedBox(height: UnifeiSpaces.sm),
        Wrap(
          spacing: UnifeiSpaces.md,
          runSpacing: UnifeiSpaces.md,
          children: children,
        ),
      ],
    );
  }
}

class _BottomNavDemo extends StatefulWidget {
  const _BottomNavDemo();

  @override
  State<_BottomNavDemo> createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<_BottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return UnifeiBottomNavBar(
      margin: EdgeInsets.zero,
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}
