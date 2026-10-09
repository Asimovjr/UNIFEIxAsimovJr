import 'package:flutter/material.dart';

import '../themes/unifei_fonts.dart';
import '../themes/unifei_colors.dart';

/// Tela provisória para rotas que ainda não foram implementadas.
///
/// Cada uso é trocado pela tela de verdade no router quando ela existir.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: UnifeiFonts.sectionTitle.copyWith(
                color: UnifeiColors.textPrimary,
              ),
            ),
            Text(
              'Em construção',
              style: UnifeiFonts.supporting.copyWith(
                color: UnifeiColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
