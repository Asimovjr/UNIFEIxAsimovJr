import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Família tipográfica e estilos de texto do Figma.
///
/// A base é o conjunto "Tipografia v2", o mais usado na página
/// "Prototipagem Oficial". Os estilos "PRG/UI" que ainda aparecem nas telas
/// também estão aqui.
///
/// A fonte (Source Sans 3) vem do pacote `google_fonts`. Por isso os estilos
/// são `final` e não `const`.
///
/// Os estilos não definem cor. A cor entra com `copyWith(color: ...)`, usando
/// as cores de `UnifeiColors`.
abstract class UnifeiFonts {
  /// Nome da família registrada pelo Google Fonts, para os casos que precisam
  /// só da fonte, sem um estilo pronto (ex.: `ThemeData.fontFamily`).
  static String get family => GoogleFonts.sourceSans3().fontFamily!;

  // Pesos usados no design.
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;

  // ---------------------------------------------------------------------------
  // Tipografia v2
  // ---------------------------------------------------------------------------

  /// "Título de página": título principal de cada tela.
  static final TextStyle pageTitle = GoogleFonts.sourceSans3(
    fontSize: 40,
    height: 1.05,
    fontWeight: black,
    letterSpacing: -1.2, // -3%
  );

  /// "Título de seção": títulos que separam blocos da tela ("Avisos").
  static final TextStyle sectionTitle = GoogleFonts.sourceSans3(
    fontSize: 22,
    height: 1.2,
    fontWeight: bold,
    letterSpacing: -0.22, // -1%
  );

  /// "Título de item": título de cards e itens de lista.
  static final TextStyle itemTitle = GoogleFonts.sourceSans3(
    fontSize: 18,
    height: 1.25,
    fontWeight: semiBold,
  );

  /// "Corpo": textos longos (corpo de avisos, descrições).
  static final TextStyle body = GoogleFonts.sourceSans3(
    fontSize: 15,
    height: 1.4,
    fontWeight: regular,
  );

  /// "Apoio": textos secundários abaixo de títulos.
  static final TextStyle supporting = GoogleFonts.sourceSans3(
    fontSize: 14,
    height: 1.35,
    fontWeight: regular,
  );

  /// "Link": ações em texto ("Saiba mais", "Ver todos").
  static final TextStyle link = GoogleFonts.sourceSans3(
    fontSize: 14,
    height: 1.35,
    fontWeight: semiBold,
  );

  /// "Sobretítulo": texto acima de um título ("PRÓXIMA AVALIAÇÃO").
  ///
  /// No Figma o texto é exibido em maiúsculas. O `TextStyle` não converte o
  /// texto, então ele já precisa estar em maiúsculas (ou passar por
  /// `.toUpperCase()`).
  static final TextStyle overline = GoogleFonts.sourceSans3(
    fontSize: 12,
    height: 1.4,
    fontWeight: semiBold,
    letterSpacing: 0.96, // 8%
  );

  /// "Etiqueta": metadados curtos em maiúsculas ("MAT002 · TURMA 01", "AGO").
  ///
  /// Assim como em [overline], o texto precisa estar em maiúsculas.
  static final TextStyle tag = GoogleFonts.sourceSans3(
    fontSize: 11,
    height: 1.4,
    fontWeight: semiBold,
    letterSpacing: 0.66, // 6%
  );

  // ---------------------------------------------------------------------------
  // PRG/UI (estilos antigos que ainda aparecem nas telas)
  // ---------------------------------------------------------------------------

  /// "PRG/UI/Label": rótulos curtos (acessos rápidos, badges).
  static final TextStyle label = GoogleFonts.sourceSans3(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: medium,
  );

  /// "PRG/UI/Action": ações em botões e chips.
  static final TextStyle action = GoogleFonts.sourceSans3(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: semiBold,
  );

  /// "PRG/UI/Supporting": legendas pequenas ("Terça-feira, 18 de agosto").
  static final TextStyle caption = GoogleFonts.sourceSans3(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: regular,
  );

  /// Rótulos da barra de navegação inferior. Não é um estilo nomeado no
  /// Figma, mas é o que a `Bottom Navigation` usa em todas as telas.
  static final TextStyle navLabel = GoogleFonts.sourceSans3(
    fontSize: 11,
    height: 14 / 11,
    fontWeight: medium,
  );
}
