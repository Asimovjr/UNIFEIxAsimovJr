import 'package:flutter/material.dart';

/// Cores compartilhadas, tiradas da página "Prototipagem Oficial" do Figma.
///
/// As sombras ficam em `UnifeiShadows`, no `unifei_theme.dart`.
abstract class UnifeiColors {
  // Base da interface (variáveis "draft/color" do Figma).
  static const Color primary = Color(0xFF003A70);
  static const Color textPrimary = Color(0xFF20343E);
  static const Color textSecondary = Color(0xFF4B647C);
  static const Color textSupporting = Color(0xFF6E8296);
  static const Color blueComplementary = Color(0xFF6D9BC8);
  static const Color blueLight = Color(0xFFE7EFF9);
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFDCE3EB);

  // Superfícies neutras, chips, bordas e divisórias.
  static const Color surfaceMuted = Color(0xFFF0F3F6);
  static const Color surfaceSegmented = Color(0xFFF0F2F5);
  static const Color textMuted = Color(0xFF526579);
  static const Color borderLight = Color(0xFFE8F0FA);
  static const Color borderInput = Color(0xFFD6DEE5);
  static const Color borderDashed = Color(0xFFC5D0DC);
  static const Color divider = Color(0xFFDBE3ED);
  static const Color dividerSubtle = Color(0xFFEEF2F6);
  static const Color pageIndicatorInactive = Color(0xFFD1DEED);
  static const Color timelineDone = Color(0xFF9AA3AB);
  static const Color timelineMarker = Color(0xFFA9B6C4);

  // Conteúdo sobre o azul principal (cards e heros azuis).
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimarySecondary = Color(0xFFD4E5FA);
  static const Color onPrimaryMuted = Color(0xFFC9D8E8);
  static const Color onPrimaryOverline = Color(0xFF8FB3DA);
  static const Color onPrimaryDivider = Color(0xFF2A5585);
  static const Color onPrimaryDividerSoft = Color(0xA63D8FCC);

  // Azul principal com transparência (divisórias e ilustrações).
  static const Color primary08 = Color(0x14003A70);
  static const Color primary10 = Color(0x1A003A70);

  // Estados: sucesso, atenção e erro, cada um com cor, fundo e texto.
  static const Color success = Color(0xFF1F8A4C);
  static const Color successTint = Color(0xFFE6F4EC);
  static const Color successText = Color(0xFF17663A);
  static const Color warning = Color(0xFFB7791F);
  static const Color warningTint = Color(0xFFFCF0D8);
  static const Color warningText = Color(0xFF805318);
  static const Color danger = Color(0xFFB42318);
  static const Color dangerTint = Color(0xFFFFEFEC);
  static const Color dangerIcon = Color(0xFFAD4035);

  /// Fundo escurecido atrás de modais e bottom sheets.
  static const Color scrim = Color(0x470F1F2E);

  // Cores de contexto (matérias, avaliações e calendário).
  static const Color subjectAccent = Color(0xFFE4572E);
  static const Color subjectHeader = Color(0xFFC7401F);
  static const Color assessmentBlue = Color(0xFF2D7DD2);
  // `calendarEvent` vem do estilo antigo "Core Destaque" do Figma, que não
  // aparece mais nas telas oficiais.
  static const Color calendarEvent = Color(0xFF7C3AED);
  static const Color calendarHoliday = Color(0xFFC7333C);
  static const Color indicatorGreen = Color(0xFF1E8E5A);
  static const Color indicatorRed = Color(0xFFC8352B);

  /// Pares de cor de cada matéria: [UnifeiSubjectColors.accent] para barras e
  /// marcadores, [UnifeiSubjectColors.strong] para textos e cabeçalhos.
  static const UnifeiSubjectColors calculo = UnifeiSubjectColors(
    accent: Color(0xFFE4572E),
    strong: Color(0xFFC7401F),
  );
  static const UnifeiSubjectColors fisica = UnifeiSubjectColors(
    accent: Color(0xFF2D7DD2),
    strong: Color(0xFF1F64B0),
  );
  static const UnifeiSubjectColors circuitos = UnifeiSubjectColors(
    accent: Color(0xFF7A5BC7),
    strong: Color(0xFF5F43A8),
  );
  static const UnifeiSubjectColors algebraLinear = UnifeiSubjectColors(
    accent: Color(0xFFC93D74),
    strong: Color(0xFFA82E5D),
  );
  static const UnifeiSubjectColors algoritmos = UnifeiSubjectColors(
    accent: Color(0xFF15A08C),
    strong: Color(0xFF0E7F6F),
  );
  static const UnifeiSubjectColors probabilidade = UnifeiSubjectColors(
    accent: Color(0xFFE8A33D),
    strong: Color(0xFFA86A10),
  );

  // Brancos com transparência, usados sobre cabeçalhos e imagens coloridas.
  static const Color overlay12 = Color(0x1FFFFFFF);
  static const Color overlay16 = Color(0x29FFFFFF);
  static const Color overlay28 = Color(0x47FFFFFF);
  static const Color overlay75 = Color(0xBFFFFFFF);
  static const Color overlay78 = Color(0xC7FFFFFF);
  static const Color overlay82 = Color(0xD1FFFFFF);
  static const Color overlay88 = Color(0xE0FFFFFF);
}

/// Cor de destaque e cor forte de uma matéria, mais o fundo com 9% de
/// opacidade usado como realce (ex.: próxima avaliação na linha do tempo).
class UnifeiSubjectColors {
  const UnifeiSubjectColors({required this.accent, required this.strong});

  final Color accent;
  final Color strong;

  Color get tint => accent.withValues(alpha: 0.09);
}
