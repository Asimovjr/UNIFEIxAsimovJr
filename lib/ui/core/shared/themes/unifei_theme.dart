import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'unifei_colors.dart';
import 'unifei_fonts.dart';

/// Tema do app, montado com as cores de [UnifeiColors] e os estilos de
/// [UnifeiFonts].
///
/// Com o tema configurado, os widgets do Material (AppBar, TextButton,
/// Divider...) já saem com a cara do app, e as telas podem usar
/// `Theme.of(context).textTheme` em vez de importar os estilos direto.
abstract class UnifeiTheme {
  static final ThemeData light = ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: UnifeiColors.background,
    fontFamily: UnifeiFonts.family,
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: UnifeiColors.background,
      foregroundColor: UnifeiColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: UnifeiFonts.itemTitle.copyWith(
        color: UnifeiColors.textPrimary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: UnifeiColors.primary,
        textStyle: UnifeiFonts.link,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: UnifeiColors.divider,
      thickness: 1,
      space: 1,
    ),
  );

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: UnifeiColors.primary,
    onPrimary: UnifeiColors.onPrimary,
    primaryContainer: UnifeiColors.blueLight,
    onPrimaryContainer: UnifeiColors.primary,
    secondary: UnifeiColors.blueComplementary,
    onSecondary: UnifeiColors.onPrimary,
    error: UnifeiColors.danger,
    onError: UnifeiColors.onPrimary,
    errorContainer: UnifeiColors.dangerTint,
    onErrorContainer: UnifeiColors.danger,
    surface: UnifeiColors.surface,
    onSurface: UnifeiColors.textPrimary,
    onSurfaceVariant: UnifeiColors.textSecondary,
    outline: UnifeiColors.border,
    outlineVariant: UnifeiColors.divider,
    scrim: UnifeiColors.scrim,
  );

  /// Liga os papéis de texto do Material aos estilos do Figma. Os papéis que
  /// não aparecem aqui ficam com o padrão do Material, já na Source Sans 3.
  static final TextTheme _textTheme = GoogleFonts.sourceSans3TextTheme()
      .copyWith(
        headlineLarge: UnifeiFonts.pageTitle,
        titleLarge: UnifeiFonts.sectionTitle,
        titleMedium: UnifeiFonts.itemTitle,
        bodyLarge: UnifeiFonts.body,
        bodyMedium: UnifeiFonts.supporting,
        bodySmall: UnifeiFonts.caption,
        labelLarge: UnifeiFonts.action,
        labelMedium: UnifeiFonts.label,
        labelSmall: UnifeiFonts.tag,
      )
      .apply(
        bodyColor: UnifeiColors.textPrimary,
        displayColor: UnifeiColors.textPrimary,
      );
}

/// Sombras azuladas do Figma.
abstract class UnifeiShadows {
  /// Card azul de próxima atividade (Home).
  static const List<BoxShadow> activityCard = [
    BoxShadow(color: Color(0x1A003366), offset: Offset(0, 4), blurRadius: 12),
  ];

  /// Cards brancos padrão (ex.: Cardápio RU).
  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x17003366), offset: Offset(0, 4), blurRadius: 14),
  ];

  /// Cards do carrossel de avisos.
  static const List<BoxShadow> notice = [
    BoxShadow(color: Color(0x1C003380), offset: Offset(0, 5), blurRadius: 18),
  ];
}
