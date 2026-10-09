import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/shared/themes/unifei_fonts.dart';
import '../../core/shared/themes/unifei_spaces.dart';
import '../../core/shared/themes/unifei_colors.dart';

/// Tela inicial (aba "Início").
///
/// Por enquanto serve de exemplo de navegação: o botão abre uma matéria, que
/// fica na aba "Matérias". A barra inferior troca o item ativo sozinha.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(UnifeiSpaces.screenGutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Início',
                style: UnifeiFonts.pageTitle.copyWith(
                  color: UnifeiColors.textPrimary,
                ),
              ),
              const SizedBox(height: UnifeiSpaces.lg),
              TextButton(
                onPressed: () => context.go(Routes.materia('calculo-2')),
                child: const Text('Abrir Cálculo II'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
